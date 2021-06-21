# Price Calculator

## Usage
* Clone the repo: `git clone https://github.com/rx/price_calculator.git`
* Run the calculator: `./price_calculator`
* Prosper

## Specs
To run the specs

    bundle install
    bundle exec rspec

## History
The first version introduced a few implementation classes. Data access was direct on top of the underlying hash of the YAML configuration files.

If you would like to see version 1

    git checkout 'v1'

The refactor introduced the `Register` as the top level interface and added repository and models wrappers for data access.

## Docs
If docs are your thing run:

    rdoc

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
