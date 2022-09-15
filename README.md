# cml-playground

generate github actions cml workflows with `./build.sh`

## List of CML examples
- https://github.com/iterative/cml_base_case
- https://github.com/iterative/cml_dvc_case
- https://github.com/iterative/example_model_export_cml

- https://github.com/iterative/demo-fashion-mnist
- https://github.com/iterative/magnetic-tiles-defect
- https://github.com/iterative/demo-bank-customer-churn
- https://github.com/iterative/stale-model-example

## defintions / vars

## File Structure
- `examples` (WIP, build docs/demos/etc examples from here and PR to there repestive locations)
- `workflows` (tests/base for `.github/workflows`)
    - `.` workflows that run in this repo
    - `checks-*.yml` tools to make sure nothing is going wrong
    - `cml-*.yml`, `tpi-*.yml` tests which are named for a specific issue or pr, they should validate it's functionality. **Ideally** they run on schedule via the lastest published version, and manually against a specific branch (default master)
- `includes` (were reusable chunks live)
    - `.` most oftenly used items
    - `aws` components more specific to AWS
    - `gcp` components more specific to GCP
    - `steps` commonly used "complete" github actions steps
    - `tests` testing elements which may be reapeated/reused
# Useful References
The worklfow's are generated using some slight hacking of `cpp` the C-preprocessor. But Why? So that when there is an update to a chunk of a commonly reused action, its updated once and goes everywhere.
This could be some as simple as `actions/checkout@v2` -> `actions/checkout@v3` or something more involved.
- https://www.man7.org/linux/man-pages/man1/cpp.1.html
- https://gcc.gnu.org/onlinedocs/gcc-12.1.0/cpp.pdf

