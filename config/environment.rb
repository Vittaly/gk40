# -*- encoding : utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Gk40::Application.initialize!

Time::DATE_FORMATS[:ru_datetime] = "%d.%m.%Y %k:%M:%S"
