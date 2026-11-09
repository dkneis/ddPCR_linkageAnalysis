# ddPCR linkage analysis

This repository contains data and R code related to the manuscript **Prospects and limitations of multiplex digital
PCR to resolve gene context in antibiotic resistance monitoring and research** by David Kneis, Thomas U. Berendonk, and Magali de la Cruz Barrón.

(DOI: *will be inserted after manuscript publication*)

If you are seriously interested in any additional information not fully covered by this repository or the manuscript, please contact the corresponding author, David Kneis (firstname.lastname@tu-dresden.de).

## Tabular datasets

### General information

Tabular files are provided as plain text using a TAB character as column delimiter.

### Files

- **```observedFractionLinked.txt```**: This table holds experimental estimates of the fraction of linked markers when pure plasmid DNA is used as input. The true fraction of linkage equals one (100%) and observed numbers lower than one reflect (primarily) DNA fragmentation.

## Sequence datasets

### General information

We provide the nucleotide sequences of the two plasmids not published so far. The sequences represent long read-base preliminary assemblies performed by the commercial provider [PlasmidSaurus](https://plasmidsaurus.com/).

The original plasmid was isolated from wastewater by [Caucci et al, 2016](10.1093/femsec/fiw060) and later conjugated into *E. coli* to study evolution mediated by the insertion sequence IS26.

The files are provided in the common [fasta format](https://en.wikipedia.org/wiki/FASTA_format).

### Files 

- **```pW12out26c.fasta```**: Original plasmid (58161 bp).
- **```pW12out26x.fasta```**: Remaining plasmid after a major excision event likely triggerend by IS26 (36489 bp).

## Source code

### General information

All source code is for the free [R software](https://www.r-project.org).

### External code of relevance

Basic functions for analyzing and simulating linkage can be found in the author's R package [```molbio```](https://github.com/dkneis/molbio/). The relevant functions from that package are:

- **```ddPCR_linked_duplex```**: For analysing observations made with duplex ddPCR
- **```ddPCR_linked_expected```**: Statistical expectation about linkage detection
- **```ddPCR_simulate_duplex```**: Generates virtual observations

### Files provided in this repository

- **```copyNumberEffect.r```**: Estimates the uncertainty of ddPCR-based quantification in relation to the number of copies per reaction and the number of partitions.

- **```divergingAbundanceEffect.r```**: Virtual experiments to demonstrate the impact of diverging marker abundances on the error of linkage quantification.
