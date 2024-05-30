name: "Question"
description: Ask a general question about anything.
title: "Summarize your question."
labels: ["question"]
assignees: iceeburr
body:
  - type: textarea
    id: description
    attributes:
      label: "Description"
      description: Please enter an explicit description of what you want to ask.
      value: Short, but detailed description of your question.
    validations:
      required: true
  - type: textarea
    id: media
    attributes:
      label: "Screenshots & Videos"
      description: If applicable, add any media files to help explain your question.
      value: |
        ![DESCRIPTION](LINK.png)
      render: bash
    validations:
      required: false
  - type: textarea
    id: additional
    attributes:
      label: "Additional Information"
      description: "Include any additional information about the question."
    validations:
      required: false
  - type: checkboxes
    id: "checklist"
    attributes:
      label: "Checklist"
      description: "Please try to do all of the checks below."
      options:
        - label: "You clearly titled/explained your question."
          required: true
        - label: "You accurately described/contextualized the reasoning behind your question."
          required: true
        - label: "IF applicable to your question, you provided visual examples/references to accurately represent what you are questioning."
          required: false