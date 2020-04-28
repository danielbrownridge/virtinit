virtinit
========

.. image:: https://travis-ci.com/danielbrownridge/virtinit.svg?branch=master
    :target: https://travis-ci.com/danielbrownridge/virtinit

virtinit is short for Virtualization Initialization. It is a script to help
bootstrap a personal machine for doing development with virtual machines.
This involves doing some hardware checks and installing a specific set of
software. The approach taken is quite prescriptive and has grown out of a set
of personal preferences found to be useful but it may also prove useful to
you.

The script is currently targeted at Ubuntu 18.04 LTS.

Install list
------------
* `pip  <https://pip.pypa.io/en/stable/>`_
* `wheel <https://pypi.org/project/wheel/>`_
* `setuptools <https://pypi.org/project/setuptools/>`_
* `Ansible (with Python 3 support) <https://www.ansible.com/>`_
* `Virtualbox 6.0 <https://www.virtualbox.org/>`_
* `Vagrant <https://www.vagrantup.com/>`_

Instructions
============

#. Clone this repository

#. Run the script::

   $ ./virtinit
