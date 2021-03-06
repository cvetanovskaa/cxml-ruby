# cXML-Ruby

![Ruby Specs](https://github.com/officeluv/cxml/workflows/Ruby%20Specs/badge.svg)

Ruby implementation of the cXML protocol. 

Currently supports these top-level documents in v1.2.037:

- Request
  - InvoiceDetailRequest
  - OrderRequest
  - PunchOutSetupRequest
  - ConfirmationRequest
- Response
  - Status
  - PunchOutSetupResponse
- Message
  - PunchOutOrderMessage
- Pull requests welcome to support more!

## Usage

```rb
some_xml = '....'
parsed_hash = CXML::Parser.new(data: some_xml).parse
# or
doc = CXML::Document.new.from_xml(some_xml)
# or
doc = CXML::Document.new(parsed_hash)
# raises CXML::UnknownAttributeError if unknown fields are present

doc.response.status.code
# => 200
doc.response.status.success?
# => true

# initialize docs with a hash
CXML::Document.new(response: { status: { code: '200' } }).to_xml
# => '<?xml.....'

# initialize docs with instances
status = CXML::Status.new(code: '200')
response = CXML::Response.new(status: status)
CXML::Document.new(response: response).to_xml
# => '<?xml.....'

# Set a different version
CXML::Document.new(version: '1.1.0', response: { status: { code: '200' } }).to_xml
# => '<?xml.....'
```

## Installation

Add this line to the application's Gemfile:

```ruby
gem 'cxml-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cxml-ruby

## Configuration

```rb
CXML.configure do |config|
  # Set this to false to log intead of raise exception on unknown elements
  # defaults to true, raises CXML::UnknownAttributeError
  config.raise_unknown_elements = true

  # Optionally set a custom logger, used for parsing error logging
  # defaults to Logger.new(STDOUT, level: :warn)
  config.logger = Logger.new(STDOUT, level: :warn)
end
```

## Running Tests

Install dependencies:

```sh
bundle install
```

Run suite:

```sh
rspec
```

## Documentation

Procotol specifications could be found here [http://xml.cxml.org/current/cXMLUsersGuide.pdf](http://xml.cxml.org/current/cXMLUsersGuide.pdf)
