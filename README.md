# OpenSCAP notes

> Docs: https://github.com/OpenSCAP/openscap/blob/maint-1.3/docs/manual/manual.adoc#45-generating-results-compatible-with-stig-viewer


## Generating results compatible with STIG Viewer 

DISA STIG Viewer is a graphical user interface (GUI) application that enables
easy viewing of SCAP-formatted Security Technical Implementation Guides
(STIGs). For more information on DISA STIG Viewer see the
https://public.cyber.mil/stigs/srg-stig-tools/[SRG / STIG Tools] website.

OpenSCAP can generate results compatible with STIG Viewer even when evaluating
SCAP content that uses different rule IDs than the official DISA STIG format,
for example, content from the `scap-security-guide` package or third-party
content.

To produce results compatible with STIG Viewer, each rule in an SCAP source data
stream must contain a reference to a STIG Rule ID, and the value of the `href`
attribute must be either
`http://iase.disa.mil/stigs/Pages/stig-viewing-guidance.aspx` or
`https://public.cyber.mil/stigs/srg-stig-tools/`.

For example:
----
<Rule id="rpm_verify_permissions">
  ...
  <reference href="https://public.cyber.mil/stigs/srg-stig-tools/">SV-86473r2_rule</reference>
  ...
</Rule>
----

In the following example, we use the
`/usr/share/xml/scap/ssg/content/ssg-rhel7-ds.xml` file provided by the
`scap-security-guide` RPM package. This data stream file meets both
prerequisites for rules.

1) Scan your system using the `oscap` command with the `--stig-viewer` option.

```bash
oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_stig --stig-viewer results-stig.xml /usr/share/xml/scap/ssg/content/ssg-rhel8-xccdf.xml
```

2) Download a STIG file of your choice, for example, from the
https://public.cyber.mil/stigs/downloads/[STIGs Document Library], and extract
it. The version of the STIG must conform to the version of the
`xccdf_org.ssgproject.content_profile_stig` profile.

3) In STIG Viewer, click on `File` and then on `Import STIG`. Then, select the
STIG in `STIGs` panel on the left side. Click on `Checklists` and then on
`Create Checklists - Check Marked STIG(s)`.

4) Import the OpenSCAP scan results by clicking on `Import` and then on `XCCDF
Results File`. Locate the `results-stig.xml` file obtained in step 1. STIG
Viewer shows the results subsequently.

> NOTE: The `--stig-viewer` option serves for evaluating an SCAP source data stream
other than a STIG provided by DISA, for example, `scap-security-guide` content
and loading the generated file in STIG Viewer into a checklist created from a
STIG by DISA. When evaluating a STIG provided by DISA using `oscap`, use the
`--results` option instead. Similarly, when creating checklists based on
`scap-security-guide` content in STIG Viewer and evaluating
`scap-security-guide` by oscap, use `--results` instead of `--stig-viewer`.

