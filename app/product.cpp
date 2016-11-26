#include "product.h"
#include <QBuffer>
#include <QDebug>
#include <QHttpPart>
#include <qimage.h>
#include <QGuiApplication>
#include <QWindow>

Product::Product()
{
    m_manager = new QNetworkAccessManager();
    connect(m_manager, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(replyFinished(QNetworkReply*)));

    QGuiApplication *app = qobject_cast<QGuiApplication*>(qApp);

    foreach (QWindow *win, app->allWindows()) {
        QQuickWindow *quickWin = qobject_cast<QQuickWindow*>(win);
        if (quickWin) {
            m_mainWindow = quickWin;
        }
    }


}

Product::~Product()
{
    delete m_manager;
}

void Product::setScanRect(const QRect &rect)
{
    if (m_scanRect != rect) {
        qDebug() << "new rectangle has been setted with size :" << rect.height() << " * " << rect.width();
        m_scanRect = rect;
    }
}

QRect Product::scanRect() const
{
    return m_scanRect;
}

void Product::grab()
{
    if (!m_mainWindow) {
        return;
    }


    QImage img = m_mainWindow->grabWindow();

    if (m_scanRect.isValid()) {
        img = img.copy(m_scanRect);
    }

    qDebug() << "got image" << img.size();

}

void Product::addPicture(QImage *img, QString productCode, QString label)
{
    if(!m_manager) {
        qDebug() << "no network manager avaible";
        return;
    }

    QByteArray ba;
    QBuffer buffer(&ba);
    buffer.open(QIODevice::WriteOnly);
    img->save(&buffer, "PNG"); // writes image into ba in PNG format

    //QUrl url("http://localhost/off/upload.php");
    QUrl url(BASE_URL);

    //code: the barcode
    //imagefield: "front"
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);

    QHttpPart barcodePart;
    barcodePart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"code\""));
    barcodePart.setBody("ww");

    QHttpPart fieldPart;
    fieldPart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"imagefield\""));
    fieldPart.setBody("front");

    QHttpPart imagePart;
    imagePart.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("image/png"));
    imagePart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"imgupload_front\"; filename=\"barcode_front.png\";" ));


    imagePart.setBody(ba);
    //    imagePart.setBody();


    multiPart->append(barcodePart);
    multiPart->append(fieldPart);
    multiPart->append(imagePart);


    //QNetworkRequest request(url);

    //QNetworkAccessManager manager;
    //QNetworkReply *reply = manager.post(request, multiPart);
    //multiPart->setParent(reply); // delete the multiPart with the reply
    m_manager->post(QNetworkRequest(url), multiPart);
    //m_manager->get(QNetworkRequest(QUrl(BASE_URL)));
}

void Product::replyFinished(QNetworkReply *reply)
{
    qDebug() << "request finshed, reply receveid";
    qDebug() << reply->error(); //prints 0. So it worked. Yay!
    QByteArray data=reply->readAll();
    qDebug() << data; // This is blank / empty
    QString str(data);
    qDebug() << "Contents of the reply: ";
    qDebug() << str; //this is blank or does not print.



}
