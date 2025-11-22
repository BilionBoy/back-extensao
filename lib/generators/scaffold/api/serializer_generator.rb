# frozen_string_literal: true

module Scaffold
  module Api
    class SerializerGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      argument :attributes, type: :array, default: []

      def generate_serializer
        template "serializer.rb.tt", "app/serializers/#{file_name}_serializer.rb"
      end
    end
  end
end
