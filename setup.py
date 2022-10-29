from setuptools import setup, find_packages

setup(name='hello',
      version='0.1.0',
      entry_points={
          'console_scripts': [
              'hello-python = hello:main',
          ],
      })

# EOF #
