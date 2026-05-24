# PPA Scoring for the cv32e40p RISC-V Processor

To gather the scoring metrics for the cv32e40p RISC-V processor please place a copy of this directory in the top-level of the cv32e40p repo and run the `run_ppa.sh` script. In order for this script to work you must have installed [Yosys](https://yosyshq.net/yosys/), [OpenSTA](https://github.com/The-OpenROAD-Project/OpenSTA), and [sv2v](https://github.com/zachjs/sv2v).

Please note, the synthesis for this project can take some time (on my local machine it took about 30 minutes) so please be patient and account for the delay.
