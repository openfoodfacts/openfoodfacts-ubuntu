#include "product.h"
#include <QDebug>

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

void Product::addPicture(QImage *img, QString label)
{
    if(!m_manager) {
        return;
    }
    m_manager->get(QNetworkRequest(QUrl(BASE_URL)));
}

void Product::replyFinished(QNetworkReply *reply)
{
    qDebug() << "request finshed, reply receveid";

}
