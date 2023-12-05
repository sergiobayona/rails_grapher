require 'rails_helper'

RSpec.describe 'renders all model metadata', type: :request do
  it " creates a Widget and redirects to the Widget's page" do
    get '/rails_grapher/graph'
    JSON.parse(response.body)
    # expect(response.body).to include_json(
    #   {
    #     "project_models": {
    #       "Task": {
    #         "attributes": [
    #           {
    #             "completed_at": {
    #               "type": 'datetime',
    #               "limit": nil,
    #               "default": nil,
    #               "null": true
    #             }
    #           },
    #           {
    #             "created_at": {
    #               "type": 'datetime',
    #               "limit": nil,
    #               "default": nil,
    #               "null": false
    #             }
    #           },
    #           {
    #             "description": {
    #               "type": 'text',
    #               "limit": nil,
    #               "default": nil,
    #               "null": true
    #             }
    #           },
    #           {
    #             "id": {
    #               "type": 'integer',
    #               "limit": nil,
    #               "default": nil,
    #               "null": false
    #             }
    #           },
    #           {
    #             "title": {
    #               "type": 'string',
    #               "limit": nil,
    #               "default": nil,
    #               "null": true
    #             }
    #           },
    #           {
    #             "updated_at": {
    #               "type": 'datetime',
    #               "limit": nil,
    #               "default": nil,
    #               "null": false
    #             }
    #           },
    #           {
    #             "user_id": {
    #               "type": 'integer',
    #               "limit": nil,
    #               "default": nil,
    #               "null": true
    #             }
    #           }
    #         ],
    #         "associations": [
    #           {
    #             "user": {
    #               "type": 'belongs_to',
    #               "options": {
    #                 "inverse_of": 'tasks'
    #               }
    #             }
    #           }
    #         ],
    #         "validations": [
    #           {
    #             "user": [
    #               {
    #                 "type": 'PresenceValidator',
    #                 "options": {
    #                   "message": 'required',
    #                   "if": {}
    #                 }
    #               }
    #             ]
    #           }
    #         ],
    #         "scopes": [],
    #         "methods": %w[
    #           __callbacks
    #           _reflections
    #           _validators
    #           attribute_aliases
    #           defined_enums
    #         ]
    #       },
    #       "User": {
    #         "attributes": [
    #           {
    #             "created_at": {
    #               "type": 'datetime',
    #               "limit": nil,
    #               "default": nil,
    #               "null": false
    #             }
    #           },
    #           {
    #             "email": {
    #               "type": 'string',
    #               "limit": nil,
    #               "default": nil,
    #               "null": true
    #             }
    #           },
    #           {
    #             "id": {
    #               "type": 'integer',
    #               "limit": nil,
    #               "default": nil,
    #               "null": false
    #             }
    #           },
    #           {
    #             "name": {
    #               "type": 'string',
    #               "limit": nil,
    #               "default": nil,
    #               "null": true
    #             }
    #           },
    #           {
    #             "password_digest": {
    #               "type": 'string',
    #               "limit": nil,
    #               "default": nil,
    #               "null": true
    #             }
    #           },
    #           {
    #             "updated_at": {
    #               "type": 'datetime',
    #               "limit": nil,
    #               "default": nil,
    #               "null": false
    #             }
    #           }
    #         ],
    #         "associations": [
    #           {
    #             "completed_tasks": {
    #               "type": 'has_many',
    #               "options": {
    #                 "class_name": 'Task'
    #               }
    #             }
    #           },
    #           {
    #             "tasks": {
    #               "type": 'has_many',
    #               "options": {
    #                 "dependent": 'destroy'
    #               }
    #             }
    #           }
    #         ],
    #         "validations": [
    #           {
    #             "email": [
    #               {
    #                 "type": 'PresenceValidator',
    #                 "options": {}
    #               },
    #               {
    #                 "type": 'LengthValidator',
    #                 "options": {
    #                   "maximum": 255
    #                 }
    #               },
    #               {
    #                 "type": 'FormatValidator',
    #                 "options": {
    #                   "with": '(?i-mx:\\A[\\w+\\-.]+@[a-z\\d\\-.]+\\.[a-z]+\\z)'
    #                 }
    #               },
    #               {
    #                 "type": 'UniquenessValidator',
    #                 "options": {
    #                   "case_sensitive": false
    #                 }
    #               }
    #             ]
    #           },
    #           {
    #             "name": [
    #               {
    #                 "type": 'PresenceValidator',
    #                 "options": {}
    #               },
    #               {
    #                 "type": 'LengthValidator',
    #                 "options": {
    #                   "maximum": 50
    #                 }
    #               }
    #             ]
    #           },
    #           {
    #             "password": [
    #               {
    #                 "type": 'ConfirmationValidator',
    #                 "options": {
    #                   "case_sensitive": true,
    #                   "allow_blank": true
    #                 }
    #               },
    #               {
    #                 "type": 'PresenceValidator',
    #                 "options": {}
    #               },
    #               {
    #                 "type": 'LengthValidator',
    #                 "options": {
    #                   "minimum": 6
    #                 }
    #               }
    #             ]
    #           }
    #         ],
    #         "scopes": [],
    #         "methods": %w[
    #           __callbacks
    #           _reflections
    #           _validators
    #           attribute_aliases
    #           defined_enums
    #           digest
    #         ]
    #       }
    #     },
    #     "project_controllers": [
    #       {
    #         "controller": 'RailsGrapher::GraphsController'
    #       }
    #     ]
    #   }
    # )
  end
end
