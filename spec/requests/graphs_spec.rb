require 'rails_helper'

RSpec.describe 'renders all model metadata', type: :request do
  it " creates a Widget and redirects to the Widget's page" do
    get '/rails_grapher/graphs'

    expect(response.body).to include_json(
      "project_models": {
        "Task": {
          "associations": [],
          "attributes": [
            {
              "completed_at": {
                "type": 'datetime',
                "limit": nil,
                "default": nil,
                "null": true
              }
            },
            {
              "created_at": {
                "type": 'datetime',
                "limit": nil,
                "default": nil,
                "null": false
              }
            },
            {
              "description": {
                "type": 'text',
                "limit": nil,
                "default": nil,
                "null": true
              }
            },
            {
              "id": {
                "type": 'integer',
                "limit": nil,
                "default": nil,
                "null": false
              }
            },
            {
              "title": {
                "type": 'string',
                "limit": nil,
                "default": nil,
                "null": true
              }
            },
            {
              "updated_at": {
                "type": 'datetime',
                "limit": nil,
                "default": nil,
                "null": false
              }
            },
            {
              "user_id": {
                "type": 'integer',
                "limit": nil,
                "default": nil,
                "null": true
              }
            }
          ],
          "methods": %w[_validators attribute_aliases defined_enums],
          "scopes": [],
          "validations": []
        },
        "User": {
          "associations": [
            {
              'completed_tasks' => {
                'type' => 'has_many',
                'options' => { 'class_name' => 'Task' }
              }
            },
            {
              'tasks' => {
                'type' => 'has_many',
                'options' => { 'dependent' => 'destroy' }
              }
            }
          ],
          "attributes": [
            {
              "created_at":
              {
                "type": 'datetime',
                "limit": nil,
                "default": nil,
                "null": false
              }
            },
            {
              "email":
              {
                "type": 'string',
                "limit": nil,
                "default": nil,
                "null": true
              }
            },
            {
              "id":
              {
                "type": 'integer',
                "limit": nil,
                "default": nil,
                "null": false
              }
            },
            {
              "name":
              {
                "type": 'string',
                "limit": nil,
                "default": nil,
                "null": true
              }
            },
            {
              "password_digest":
              {
                "type": 'string',
                "limit": nil,
                "default": nil,
                "null": true
              }
            },
            {
              "updated_at":
              {
                "type": 'datetime',
                "limit": nil,
                "default": nil,
                "null": false
              }
            }
          ],
          "methods": %w[__callbacks _reflections _validators attribute_aliases defined_enums digest],
          "scopes": [],
          "validations": [
            {
              'email': %w[FormatValidator LengthValidator PresenceValidator UniquenessValidator]
            },
            {
              'name': %w[LengthValidator PresenceValidator]
            },
            {
              'password': %w[ConfirmationValidator LengthValidator PresenceValidator]
            }
          ]
        }
      }
    )
  end
end
