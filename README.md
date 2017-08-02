# Ansible Role ansible-role-opbeat

[![Build Status](https://travis-ci.org/labpositiva/ansible-role-opbeat.svg)](https://travis-ci.org/labpositiva/ansible-role-opbeat)
[![Stories in Ready](https://badge.waffle.io/labpositiva/ansible-role-opbeat.svg?label=ready&title=Ready)](http://waffle.io/labpositiva/ansible-role-opbeat)
[![GitHub issues](https://img.shields.io/github/issues/labpositiva/ansible-role-opbeat.svg)](https://github.com/labpositiva/ansible-role-opbeat/issues)
[![GitHub license](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square)](LICENSE)


This Ansible Role infuses antigravity, you are warned

Install it with the following command:

```bash
$ ansible-galaxy install labpositiva.opbeat

```
Requirements
------------

None



## Role Variables

Here is the list of all variables and their default values:

```yaml
    ---
    # defaults file for labpositiva.opbeat
    opbeat_organization_id: ''
    opbeat_app_id: ''
    opbeat_secret_token: ''
    opbeat_project_path: ''
```


## Dependencies

none

## Example Playbook

See the [examples](./examples/) directory.

To run this playbook with default settings, create a basic playbook like this:

```yaml
    - hosts: servers
      roles:
        - labpositiva.opbeat
```


## License

MIT

## Changelog

Please see [CHANGELOG](CHANGELOG.md) for more information what has changed recently.

## Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) for details.

## Credits

- [author][link-author]
- [All Contributors][link-contributors]


---

Made with :heart: ️:coffee:️ and :pizza: by [labpositiva][link-company].

<!-- Other -->

[link-author]: https://github.com/luismayta
[link-contributors]: AUTHORS
[link-company]: https://github.com/labpositiva