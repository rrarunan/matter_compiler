  Feature: Compose

  Background:
    Given a file named "blueprint.md" with:
      """
      FORMAT: 1A

      # My API
      Description of *My API*.

      # GET /
      + Response 200 (text/plain)

              Hello World!

      # Group Red
      Description of *Red* Group.

      ## My Resource [/myresource/{id}]
      Description of *My Resource*

      + Model (application/json)
          + Headers

                  X-Header: 1
          + Body

                  { "message": "Hello World" }

          + Schema

                  { "$schema": "http://json-schema.org/draft-03/schema" }

      + Parameters
         + id = `42` (optional, number, `1000`) ... Parameter `id` description.

      ### Retrieve My Resource [GET]
      + Response 200

          [My Resource][]

      ### Create My Resource [POST]
      + Request (text/plain)

              Ni Hao!

      + Response 204
      """

    And a file named "ast.yaml" with:
      """
      _version: 1.0
      metadata:
        FORMAT:
          value: 1A
      name: My API
      description: "Description of *My API*.\n\n"
      resourceGroups:
      - name:
        description:
        resources:
        - name:
          description:
          uriTemplate: /
          model:
          parameters:
          headers:
          actions:
          - name:
            description:
            method: GET
            parameters:
            headers:
            examples:
            - name:
              description:
              requests:
              responses:
              - name: 200
                description:
                headers:
                  Content-Type:
                    value: text/plain
                body: "Hello World!\n"
                schema:
      - name: Red
        description: "Description of *Red* Group.\n\n"
        resources:
        - name: My Resource
          description: "Description of *My Resource*\n\n"
          uriTemplate: "/myresource/{id}"
          model:
            name: My Resource
            description:
            headers:
              Content-Type:
                value: application/json
              X-Header:
                value: 1
            body: "{ \"message\": \"Hello World\" }\n"
            schema: "{ \"$schema\": \"http://json-schema.org/draft-03/schema\" }\n"
          parameters:
            id:
              description: "Parameter `id` description."
              type: number
              required: false
              default: 42
              example: 1000
              values:
          headers:
          actions:
          - name: Retrieve My Resource
            description:
            method: GET
            parameters:
            headers:
            examples:
            - name:
              description:
              requests:
              responses:
              - name: 200
                description:
                headers:
                  Content-Type:
                    value: application/json
                  X-Header:
                    value: 1
                body: "{ \"message\": \"Hello World\" }\n"
                schema: "{ \"$schema\": \"http://json-schema.org/draft-03/schema\" }\n"
          - name: Create My Resource
            description:
            method: POST
            parameters:
            headers:
            examples:
            - name:
              description:
              requests:
              - name:
                description:
                headers:
                  Content-Type:
                    value: text/plain
                body: "Ni Hao!\n"
                schema:
              responses:
              - name: 204
                description:
                headers:
                body:
                schema:
      """

    And a file named "ast.json" with:
      """
      {
        "_version": "1.0",
        "metadata": {
          "FORMAT": {
            "value": "1A"
          }
        },
        "name": "My API",
        "description": "Description of *My API*.\n\n",
        "resourceGroups": [
          {
            "name": "",
            "description": "",
            "resources": [
              {
                "name": "",
                "description": "",
                "uriTemplate": "/",
                "model": {},
                "parameters": {},
                "headers": {},
                "actions": [
                  {
                    "name": "",
                    "description": "",
                    "method": "GET",
                    "parameters": {},
                    "headers": {},
                    "examples": [
                      {
                        "name": "",
                        "description": "",
                        "requests": [],
                        "responses": [
                          {
                            "name": "200",
                            "description": "",
                            "headers": {
                              "Content-Type": {
                                "value": "text/plain"
                              }
                            },
                            "body": "Hello World!\n",
                            "schema": ""
                          }
                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "name": "Red",
            "description": "Description of *Red* Group.\n\n",
            "resources": [
              {
                "name": "My Resource",
                "description": "Description of *My Resource*\n\n",
                "uriTemplate": "/myresource/{id}",
                "model": {
                    "name": "My Resource",
                    "description": "",
                    "headers": {
                      "Content-Type": {
                        "value": "application/json"
                      },
                      "X-Header": {
                        "value": "1"
                      }
                    },
                    "body": "{ \"message\": \"Hello World\" }\n",
                    "schema": "{ \"$schema\": \"http://json-schema.org/draft-03/schema\" }\n"
                  },
                "parameters": {
                  "id": {
                    "description": "Parameter `id` description.",
                    "type": "number",
                    "required": false,
                    "default": "42",
                    "example": "1000",
                    "values": []
                  }
                },
                "headers": {},
                "actions": [
                  {
                    "name": "Retrieve My Resource",
                    "description": "",
                    "method": "GET",
                    "parameters": {},
                    "headers": {},
                    "examples": [
                      {
                        "name": "",
                        "description": "",
                        "requests": [],
                        "responses": [
                          {
                            "name": "200",
                            "description": "",
                            "headers": {
                              "Content-Type": {
                                "value": "application/json"
                              },
                              "X-Header": {
                                "value": "1"
                              }
                            },
                            "body": "{ \"message\": \"Hello World\" }\n",
                            "schema": "{ \"$schema\": \"http://json-schema.org/draft-03/schema\" }\n"
                          }
                        ]
                      }
                    ]
                  },
                  {
                    "name": "Create My Resource",
                    "description": "",
                    "method": "POST",
                    "parameters": {},
                    "headers": {},
                    "examples": [
                      {
                        "name": "",
                        "description": "",
                        "requests": [
                          {
                            "name": "",
                            "description": "",
                            "headers": {
                              "Content-Type": {
                                "value": "text/plain"
                              }
                            },
                            "body": "Ni Hao!\n",
                            "schema": ""
                          }
                        ],
                        "responses": [
                          {
                            "name": "204",
                            "description": "",
                            "headers": {},
                            "body": "",
                            "schema": ""
                          }
                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
      """

  Scenario: Compose blueprint from an YAML stdin input
    When I run `matter_compiler --format yaml` interactively
    When I pipe in the file "ast.yaml"
    Then the output should match the content file "blueprint.md"

  Scenario: Compose blueprint from an YAML file
    When I run `matter_compiler ast.yaml`
    Then the output should match the content file "blueprint.md"    

  Scenario: Compose blueprint from a JSON stdin input
    When I run `matter_compiler --format json` interactively
    When I pipe in the file "ast.json"
    Then the output should match the content file "blueprint.md"

  Scenario: Compose blueprint from a JSON file
    When I run `matter_compiler ast.json`
    Then the output should match the content file "blueprint.md"
