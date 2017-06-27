#!/usr/bin/env cwl-runner

cwlVersion: v1.0

requirements:
  - class: DockerRequirement
    dockerPull: quay.io/ncigdc/fastqc_db:47f49053034376e7d76ff884ef858a7b1d0c3d682fedbe523e20fb55ccb36024
  - class: InlineJavascriptRequirement

class: CommandLineTool

inputs:
  - id: INPUT
    type: File
    inputBinding:
      prefix: --INPUT

  - id: uuid
    type: string
    inputBinding:
      prefix: --uuid

outputs:
  - id: LOG
    type: File
    outputBinding:
      glob: $(inputs.uuid + ".log")

  - id: OUTPUT
    type: File
    outputBinding:
      glob: $(inputs.INPUT.nameroot + ".db")

          
baseCommand: [/usr/local/bin/fastqc_db]
