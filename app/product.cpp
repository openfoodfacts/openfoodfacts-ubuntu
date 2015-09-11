#include "product.h"
#include <QBuffer>
#include <QDebug>
#include <QHttpPart>
#include <qimage.h>

Product::Product()
{
    m_manager = new QNetworkAccessManager();
    connect(m_manager, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(replyFinished(QNetworkReply*)));


}

Product::~Product()
{
    delete m_manager;
}

void Product::addPicture(QImage *img, QString productCode, QString label)
{
    if(!m_manager) {
        qDebug() << "no network manager avaible";
        return;
    }
//code: the barcode
//imagefield: "front"
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);

    QHttpPart textPart;
    textPart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"text\""));
    textPart.setBody("my text");

    QHttpPart imagePart;
    imagePart.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("image/jpeg"));
    imagePart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"image\""));

    QByteArray ba;
    QBuffer buffer(&ba);
    buffer.open(QIODevice::WriteOnly);
    img->save(&buffer, "PNG"); // writes image into ba in PNG format
    imagePart.setBody(ba);
//    imagePart.setBody();

    multiPart->append(textPart);
    multiPart->append(imagePart);

    QUrl url("http://my.server.tld");
    QNetworkRequest request(url);

    QNetworkAccessManager manager;
    QNetworkReply *reply = manager.post(request, multiPart);
    multiPart->setParent(reply); // delete the multiPart with the reply
    m_manager->get(QNetworkRequest(QUrl(BASE_URL)));
}

void Product::replyFinished(QNetworkReply *reply)
{
    qDebug() << "request finshed, reply receveid";


}
