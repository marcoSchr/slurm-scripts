# VulChecker

## Requirements

- [LLVM](../llvm)
- [ninja](../ninja)
- Python 3.9

## Reproduction

The data from one drive needs to be manually downloaded:

- [juliet](https://bgu365-my.sharepoint.com/:f:/g/personal/yisroel_bgu_ac_il/EuvGBQXY-WBIsZcRhYoO1dwBtw4CoQVlWx12BhL_pBdtOg?e=vuyajw_)
- [Wild Label](https://bgu365-my.sharepoint.com/:u:/g/personal/yisroel_bgu_ac_il/EWtBXjeUMyZFoQyh-QudRKkBNQzLnDRLftgavWTOSALIMQ?e=WVbRiG)

- The files are placed in `/ukp-storage-1/schroeder_e/VulChecker/data/`
- `cd /ukp-storage-1/schroeder_e/VulChecker/data/`
- `mkdir juliet`
- `mv juliet.zip juliet/`
- `python -m zipfile -e juliet.zip juliet/`
- `7za x Wild\ Labeled.7z`


# Scripts

| Script | purpose | note |
| --- | --- | --- |
| VulChecker.sh | Setup VulChecker venv |  |
| VulChecker_prepareData.sh | Script to prepate the data provided by VulChecker| |
| VulChecker_reproduce.sh | Script to reproduce VulChecker for different CWEs | not finished |
