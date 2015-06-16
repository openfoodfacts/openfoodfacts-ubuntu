# -*- Mode: Python; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-

"""Tests for the Hello World"""

from autopilot.matchers import Eventually
from testtools.matchers import Equals

import openfoodfacts


class MainViewTestCase(openfoodfacts.ClickAppTestCase):
    """Generic tests for the Hello World"""

    def test_initial_label(self):
        app = self.launch_application()
        label = app.main_view.select_single(objectName='label')
        self.assertThat(label.text, Equals('Hello..'))

    def test_click_button_should_update_label(self):
        app = self.launch_application()
        button = app.main_view.select_single(objectName='button')
        app.pointing_device.click_object(button)
        label = app.main_view.select_single(objectName='label')
        self.assertThat(label.text, Eventually(Equals('..world!')))

