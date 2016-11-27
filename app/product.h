#ifndef PRODUCT_H
#define PRODUCT_H
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QObject>
#include <QQuickWindow>

#define BASE_URL "http://off:off@world.openfoodfacts.net/cgi/product_image_upload.pl"

class Product: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QRect scanRect READ scanRect WRITE setScanRect)

public:
    Product();
    ~Product();
    QRect scanRect() const;
    void setScanRect(const QRect &rect);
    Q_INVOKABLE void addPicture(QString productCode, QString label="front");

public slots:
    void replyFinished(QNetworkReply* reply);


public slots:
    void grab();

private:
    QQuickWindow *m_mainWindow;
    QRect m_scanRect;


private :
    QNetworkAccessManager *m_manager;
};

#endif // PRODUCT_H
