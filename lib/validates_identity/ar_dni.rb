# frozen_string_literal: true

require 'validates_identity'
require_relative 'ar_dni/version'

class ValidatesIdentity
  module ArDni
    autoload :Validator, 'validates_identity/ar_dni/validator'
  end
end

ValidatesIdentity.register_person_identity_type('AR_DNI', ValidatesIdentity::ArDni::Validator)
ValidatesIdentity::ShouldaMatchers.register_person_allowed_values('AR_DNI', %w[12.123.123 12123123])
ValidatesIdentity::ShouldaMatchers.register_person_disallowed_values('AR_DNI', %w[1.123.123 12.12.123 12.123.12 12345])
