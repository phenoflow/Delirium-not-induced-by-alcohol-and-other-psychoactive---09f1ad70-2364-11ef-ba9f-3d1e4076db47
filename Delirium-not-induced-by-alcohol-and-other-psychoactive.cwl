cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  delirium-not-induced-by-alcohol-and-other-psychoactive-reaction---primary:
    run: delirium-not-induced-by-alcohol-and-other-psychoactive-reaction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  delirium-not-induced-by-alcohol-and-other-psychoactive-superimposed---primary:
    run: delirium-not-induced-by-alcohol-and-other-psychoactive-superimposed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: delirium-not-induced-by-alcohol-and-other-psychoactive-reaction---primary/output
  delirium-not-induced-by-alcohol-and-other-psychoactive-dementium---primary:
    run: delirium-not-induced-by-alcohol-and-other-psychoactive-dementium---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: delirium-not-induced-by-alcohol-and-other-psychoactive-superimposed---primary/output
  delirium-not-induced-by-alcohol-and-other-psychoactive-subacute---primary:
    run: delirium-not-induced-by-alcohol-and-other-psychoactive-subacute---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: delirium-not-induced-by-alcohol-and-other-psychoactive-dementium---primary/output
  delirious-delirium-not-induced-by-alcohol-and-other-psychoactive---primary:
    run: delirious-delirium-not-induced-by-alcohol-and-other-psychoactive---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: delirium-not-induced-by-alcohol-and-other-psychoactive-subacute---primary/output
  infective-delirium-not-induced-by-alcohol-and-other-psychoactive---primary:
    run: infective-delirium-not-induced-by-alcohol-and-other-psychoactive---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: delirious-delirium-not-induced-by-alcohol-and-other-psychoactive---primary/output
  organic-delirium-not-induced-by-alcohol-and-other-psychoactive---primary:
    run: organic-delirium-not-induced-by-alcohol-and-other-psychoactive---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: infective-delirium-not-induced-by-alcohol-and-other-psychoactive---primary/output
  cerebrovascular-delirium-not-induced-by-alcohol-and-other-psychoactive---primary:
    run: cerebrovascular-delirium-not-induced-by-alcohol-and-other-psychoactive---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: organic-delirium-not-induced-by-alcohol-and-other-psychoactive---primary/output
  delirium---primary:
    run: delirium---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: cerebrovascular-delirium-not-induced-by-alcohol-and-other-psychoactive---primary/output
  traumatic-delirium-not-induced-by-alcohol-and-other-psychoactive---primary:
    run: traumatic-delirium-not-induced-by-alcohol-and-other-psychoactive---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: delirium---primary/output
  delirium-not-induced-by-alcohol-and-other-psychoactive---primary:
    run: delirium-not-induced-by-alcohol-and-other-psychoactive---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: traumatic-delirium-not-induced-by-alcohol-and-other-psychoactive---primary/output
  delirium-not-induced-by-alcohol-and-other-psychoactive-origin---primary:
    run: delirium-not-induced-by-alcohol-and-other-psychoactive-origin---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: delirium-not-induced-by-alcohol-and-other-psychoactive---primary/output
  metabolic-delirium-not-induced-by-alcohol-and-other-psychoactive---primary:
    run: metabolic-delirium-not-induced-by-alcohol-and-other-psychoactive---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: delirium-not-induced-by-alcohol-and-other-psychoactive-origin---primary/output
  delirium-not-induced-by-alcohol-and-other-psychoactive-substance---primary:
    run: delirium-not-induced-by-alcohol-and-other-psychoactive-substance---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: metabolic-delirium-not-induced-by-alcohol-and-other-psychoactive---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: delirium-not-induced-by-alcohol-and-other-psychoactive-substance---primary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
