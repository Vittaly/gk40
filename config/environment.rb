# -*- encoding : utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Gk40::Application.initialize!

Time::DATE_FORMATS[:ru_datetime] = '%d.%m.%Y %k:%M:%S %z'
Date::DATE_FORMATS[:ru_datetime] = '%d.%m.%Y %k:%M:%S %z'
Date::DATE_FORMATS[:meterage_date] = '%Y %B'
Date::DATE_FORMATS[:default] = '%d.%m.%Y'
Time::DATE_FORMATS[:default] = '%d.%m.%Y %k:%M:%S'

Encoding.default_external = 'UTF-8'

I18n.default_locale = :ru
