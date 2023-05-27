# Website

## Purpose

This repository is used to create a static website for Matters of the Mind Therapy, LLC at https://motmtherapy.com.

It uses the Material for MkDocs set of themes and plugins, and the MkDocs static site generator (SSG) to create a simple marketing site.

Note: due to patient privacy concerns, this website is strictly a marketing site for the practice. It contains no PHI/PII, and it does not process payments.

## Technical Details

To ensure visitor privacy, the website is only available over HTTPS. TLS 1.3 is enforced.

A backup of the content in this repo is automatically mirrored from [Gitlab](https://gitlab.com/motm-therapy/website) to both [Github](https://github.com/motm-therapy/website) and [Codeberg](https://codeberg.org/motm-therapy/website).

Traffic from outside the US is challenged with captcha, and DDoS mitigation is in place, both provided courtesy of Cloudflare.

SPF, DKIM, and DMARC are used to ensure integrity and trustworthiness of email originating from the domain. Proton Mail provides email service for maximum privacy.

UptimeRobot provides monitoring of the website and other key resources vital to the practice.

