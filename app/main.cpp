/*****************************************************************************
 * Copyright: 2013 Michael Zanetti <michael_zanetti@gmx.net>                 *
 *                                                                           *
 * This file is part of ubuntu-authenticator                                 *
 *                                                                           *
 * This prject is free software: you can redistribute it and/or modify       *
 * it under the terms of the GNU General Public License as published by      *
 * the Free Software Foundation, either version 3 of the License, or         *
 * (at your option) any later version.                                       *
 *                                                                           *
 * This project is distributed in the hope that it will be useful,           *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             *
 * GNU General Public License for more details.                              *
 *                                                                           *
 * You should have received a copy of the GNU General Public License         *
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.     *
 *                                                                           *
 ****************************************************************************/

#include "qrcodereader.h"
#include "product.h"

#include <QApplication>
#include <QtQuick/QQuickView>
#include <QtQml/QtQml>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QQuickView view;
    qmlRegisterType<QRCodeReader>("CodeReader", 1, 0, "QRCodeReader");

    /*Product p;

    p.addPicture(new QImage(),"");*/
    //view.engine()->addImportPath("qrc:///component/");
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:///qml/main.qml"));
    view.show();

    return a.exec();
}
