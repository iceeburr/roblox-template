name: "Feature Request"
description: Create a new report for a bug.
title: "Summarize your report."
labels: ["enhancement"]
assignees: iceeburr
body:
  - type: dropdown
    id: "suggestion-type"
    attributes:
      label: "Suggestion Type"
      description: "What are you suggesting?"
      multiple: false
      options:
        - Feature
        - Enhancement
        - Concept Idea
    validations:
      required: true
  - type: textarea
    id: description
    attributes:
      label: "Description"
      description: Please enter an explicit description of what you want to achieve with this.
      value: Short, but detailed description of your suggestion.
    validations:
      required: true
  - type: textarea
    id: media
    attributes:
      label: "Screenshots & Videos"
      description: If applicable, add any media files to help explain your suggestion.
      value: |
        ![DESCRIPTION](LINK.png)
      render: bash
    validations:
      required: false
  - type: textarea
    id: additional
    attributes:
      label: "Additional Information"
      description: "Include any additional information about the suggestion."
    validations:
      required: false
  - type: checkboxes
    id: "checklist"
    attributes:
      label: "Checklist"
      description: "Please try to do all of the checks below."
      options:
        - label: "You clearly titled/explained your suggestion."
          required: true
        - label: "You accurately described/contextualized the reasoning behind your suggestion."
          required: true
        - label: "IF applicable to your suggestion, you provided visual examples/references to accurately represent what you are suggesting."
          required: false