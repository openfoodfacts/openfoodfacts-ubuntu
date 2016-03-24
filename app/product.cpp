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

    QByteArray ba;
    QBuffer buffer(&ba);
    buffer.open(QIODevice::WriteOnly);
    img->save(&buffer, "PNG"); // writes image into ba in PNG format

    QUrl url("http://localhost/off/upload.php");
   /* QByteArray boundary = "---------------------------87142694621188";

    QNetworkRequest request( url );
    request.setRawHeader( "Referer", "http://localhost/" );
    request.setRawHeader( "Content-Type", "multipart/form-data; boundary=" + boundary ); //<-- seulement 27 tirets


    QByteArray aadata = "--" + boundary; //<-- mais 29 ici
    aadata += "\r\nContent-Disposition: form-data; name=\"avatar\"; filename=\"image.png\";\r\n";
    // upload correspondant au nom du champ "file" du formulaire
    aadata += "Content-Type: image/png\r\n\r\n" + ba;
    aadata += "\r\n--" + boundary + "--\r\n"; //<-- et ici

    request.setHeader(QNetworkRequest::ContentLengthHeader, QVariant(QString::number( aadata.size() )) );

    m_manager->post( request, aadata );*/


    //code: the barcode
    //imagefield: "front"
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);

    QHttpPart textPart;
    textPart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"text\""));
    textPart.setBody("my text");

    QHttpPart imagePart;
    imagePart.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("image/png"));
    imagePart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"avatar\"; filename=\"image.png\";" ));


    imagePart.setBody(ba);
    //    imagePart.setBody();


    multiPart->append(textPart);
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
