# -*- Mode: Python; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-

"""Ubuntu Touch App Autopilot tests."""

import os

import ubuntuuitoolkit

from autopilot import introspection
from autopilot.matchers import Eventually
from testtools.matchers import Equals
from ubuntuuitoolkit import base


PACKAGE_ID = 'openfoodfacts.ubuntouch-fr'


def get_path_to_source_root():
    return os.path.abspath(
        os.path.join(
            os.path.dirname(__file__), '..', '..', '..', '..'))


class ApplicationCustomProxyObject(
        ubuntuuitoolkit.UbuntuUIToolkitCustomProxyObjectBase):

    """Autopilot custom proxy object for the app."""

    @classmethod
    def validate_dbus_object(cls, path, state):
        application_name = PACKAGE_ID
        name = introspection.get_classname_from_path(path)
        if str(name) == application_name:
            if state['applicationName'][1] == application_name:
                return True
        return False

    @property
    def main_view(self):
        return self.select_single(ubuntuuitoolkit.MainView)


class ClickAppTestCase(base.UbuntuUIToolkitAppTestCase):

    """Common test case that provides several useful methods for the tests."""

    project_name = 'openfoodfacts'

    def launch_application(self):
        app_qml_source_location = self._get_app_qml_source_path()
        if os.path.exists(app_qml_source_location):
            app = self._launch_application_from_source(
                app_qml_source_location)
        else:
            app = self._launch_installed_application()

        self.assertThat(app.main_view.visible, Eventually(Equals(True)))
        return app

    def _get_app_qml_source_path(self):
        qml_file_name = 'Main.qml'
        return os.path.join(self._get_path_to_project_source(), qml_file_name)

    def _get_path_to_project_source(self):
        return os.path.join(get_path_to_source_root(), self.project_name)

    def _launch_application_from_source(self, app_qml_source_location):
        return self.launch_test_application(
            base.get_qmlscene_launch_command(),
            app_qml_source_location,
            app_type='qt',
            emulator_base=ApplicationCustomProxyObject)

    def _launch_installed_application(self):
        return self.launch_click_package(
            PACKAGE_ID, emulator_base=ApplicationCustomProxyObject)

