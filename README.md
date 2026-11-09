# ddPCR linkage analysis

This repository contains data and R code related to the manuscript **Prospects and limitations of multiplex digital
PCR to resolve gene context in antibiotic resistance monitoring and research** by David Kneis, Thomas U. Berendonk, and Magali de la Cruz Barrón (DOI pending)

For any additional information, please contact the corresponding author, David Kneis (firstname.lastname@tu-dresden.de).

## Tabular datasets

### General information

### File contents 


## Sequence datasets

### General information

We provide the nucleotide sequences of the two plasmids not published so far. The sequences represent long read-base preliminary assemblies performed by the commercial provider [PlasmidSaurus](https://plasmidsaurus.com/).

The original plasmid was isolated from wastewater by [Caucci et al, 2016](10.1093/femsec/fiw060) and later conjugated into *E. coli* to study evolution mediated by the insertion sequence IS26.

The files are provided in the common [fasta format](https://en.wikipedia.org/wiki/FASTA_format).

### File contents 

- **```pW12out26c.fasta```**: Original plasmid (58161 bp).
- **```pW12out26x.fasta```**: Remaining plasmid after a major excision event likely triggerend by IS26 (36489 bp).

## Source code

### External source code of relevance

Basic functions for analyzing and simulating linkage can be found in the author's R package [```molbio```](https://github.com/dkneis/molbio/). The relevant functions from that package are:

- **```ddPCR_linked_duplex```**: For analysing observations made with duplex ddPCR
- **```ddPCR_linked_expected```**: Statistical expectation about linkage detection
- **```ddPCR_simulate_duplex```**: Generates virtual observations

### Source code provided in this repository

- **```copyNumberEffect.r```**: Estimates the uncertainty of ddPCR-based quantification in relation to the number of copies per reaction and the number of partitions.