import unittest
from unittest.mock import patch
from io import StringIO
import sys
import multiprocessing

from simple_printing_service import simplePrint


class TestSimplePrintFunction(unittest.TestCase):

    @patch('os.environ', {"MY_VARIABLE": "test_value"})
    def test_simple_print_with_existing_variable(self):
        variable_name = "MY_VARIABLE"
        interval = 0

        p = multiprocessing.Process(
            target=simplePrint, args=(variable_name, interval))
        p.start()
        p.join(5)
        self.assertTrue(p.is_alive())
        if p.is_alive():
            p.terminate()

    @patch('os.environ', {})
    def test_simple_print_with_non_existing_variable(self):
        output = StringIO()
        sys.stdout = output
        variable_name = "NON_EXISTENT_VARIABLE"
        interval = 5

        simplePrint(variable_name, interval)

        sys.stdout = sys.__stdout__  # Reset stdout

        self.assertIn(
            f"Environment variable {variable_name} is not set", output.getvalue())


if __name__ == '__main__':
    unittest.main()
