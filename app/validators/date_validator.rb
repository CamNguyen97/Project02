class DateValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    return if value.blank?
    criteria = options.keys.first
    comparation_field = parse_date record, options
    return unless comparation_field[:value]
    case criteria
    when :after
      unless value > record.try(comparation_field[:value])
        message = options[:message] || :after
        record.errors.add attribute, message, date: comparation_field[:field_name]
      end
    when :after_or_equal_to
      unless value >= record.try(comparation_field[:value])
        message = options[:message] || :after_or_equal_to
        record.errors.add attribute, message, date: comparation_field[:field_name]
      end
    end

    protected
    def parse_date record, options
      comparation_field = options.values.first
      comparation_field = begin
        {
          value: comparation_field.to_datetime,
          field_name: comparation_field 
        }
      rescue NoMethodError, ArgumentError
        {
          #value: record.try comparation_field,
          #field_name: record.class.human_attribute_name comparation_field
        }
      end
    end
  end
end