#ifndef PRODUCT_H
#define PRODUCT_H
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QObject>

#define BASE_URL "http://off:off@world.openfoodfacts.net/cgi/product_image_upload.pl"

class Product: public QObject
{
    Q_OBJECT
public:
    Product();
    ~Product();
    Q_INVOKABLE void addPicture(QImage *img, QString label="front");

public slots:
    void replyFinished(QNetworkReply* reply);

private :
    QNetworkAccessManager *m_manager;
};

#endif // PRODUCT_H
