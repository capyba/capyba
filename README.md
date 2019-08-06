# Capyba Testing Framework

This repository is very handy for creating testing automation projects based on Ruby, Capybara and Cucumber. It is an alpha version currently and you can contribute to it as well.

## Getting Started

The Capyba Testing Framework was designed aiming to make things ease. it includes almost everything you need to create your automated tests.

Some of its great features are:

- The ability to access remote databases like Microsoft SQL Server, MySQL and PostgreSQL via SSH.
- Execute API Tests.
- Create spreadsheets.
- Export customized report files.
- Generate documentation for your project.
- Send emails by the end of a test execution.
- Generate fake data information.
- Etc.

## Installing

1. Fork this repository if you want your own copy to play with
2. Clone this repository (or your fork) onto your local computer
3. If you haven't installed the "bundler" gem yet, do so now by running

```bash
gem install bundler
```

    It's ok to run this even if bundler is already installed. The "bundler" gem provides the `bundle` command.

4. In the `capyba` directory, run

```bash
bundle install
```

    to install the necessary gems. 
    If this doesn't work, either the "bundler" gem isn't installed or there is something wrong with your Ruby installation. Let us know!

## Usage

In the root folder there is a *.env* file in which you should enter the Environment variables configuration.

Example of zipping usage:

```
zf = ZipFileGenerator.new(directory_to_zip, output_file)
zf.write()
```

## Environment Keys

You can check all required and optional Environment `Keys` available [here](https://github.com/capyba/capyba/#).

## Contributing

If you want a better idea of how Capyba works, do not hesitate to colaborate.

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## Contact

Comments and feedback are welcome. Send an email to Lucas Ferreira via the [google group](https://github.com/capyba/capyba/#).

## License

This code is free to use under the terms of the MIT license.

## Observation

It is mandatory to install FreeTDS in your machine in order to use tiny_tds
