# frozen_string_literal: true

class ValidatesIdentity
  module ArDni
    class Validator
      VALIDATION_REGULAR_EXPRESSION = /^(\d{2}\.?\d{3}\.?\d{3})$/.freeze
      FORMAT_REGULAR_EXPRESSION = /(\d{2})(\d{3})(\d{3})/.freeze

      attr_reader :value

      def initialize(value)
        @value = value.to_s
      end

      def valid?
        return true if value.blank?

        result.present?
      end

      def formatted
        return if result.nil?

        result = FORMAT_REGULAR_EXPRESSION.match(striped_value)
        "#{result[1]}.#{result[2]}.#{result[3]}"
      end

      private

      def result
        @result ||= VALIDATION_REGULAR_EXPRESSION.match(value)
      end

      def striped_value
        return if result.blank?

        @striped_value ||= value.gsub(/[\.-]/, '')
      end
    end
  end
end
