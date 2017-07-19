#!/usr/bin/env cwl-runner

cwlVersion: v1.0

requirements:
  - class: DockerRequirement
    dockerPull: quay.io/ncigdc/picard_metrics_sqlite:latest
  - class: InlineJavascriptRequirement

class: CommandLineTool

inputs:
  - id: bam
    type: string
    inputBinding:
      prefix: --bam

  - id: fasta
    type: string
    inputBinding:
      prefix: --fasta

  - id: input_state
    type: string
    inputBinding:
      prefix: --input_state

  - id: metric_path
    type: File
    inputBinding:
      prefix: --metric_path

  - id: run.run_uuid
    type: string
    inputBinding:
      prefix: --run.run_uuid

  - id: vcf
    type: string
    inputBinding:
      prefix: --vcf

outputs:
  - id: log
    type: File
    outputBinding:
      glob: $(inputs.run_uuid+"_picard_CollectOxoGMetrics.log")

  - id: sqlite
    type: File
    outputBinding:
      glob: $(inputs.run_uuid + ".db")
          
baseCommand: [/usr/local/bin/picard_metrics_sqlite, --metric_name, CollectOxoGMetrics]
