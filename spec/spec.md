# did-traits 0.1 Editor's Draft

**Specification Status:** [Pre-Draft](https://github.com/decentralized-identity/org/blob/master/work-item-lifecycle.md)

**Latest Draft:** [identity.foundation/did-traits](https://identity.foundation/did-traits)

**Ratified Versions:**

**Editors:**

~ [Jan Christoph Ebersbach](https://www.linkedin.com/in/JCEbersbach) (identinet)

**Authors:**

~ [Jan Christoph Ebersbach](https://www.linkedin.com/in/JCEbersbach) (identinet)
~ [Otto Mora](https://www.linkedin.com/in/otto-mora/) (Privado ID)


**Participate:**

~ [GitHub repo](https://github.com/decentralized-identity/did-traits)

~ [File a bug](https://github.com/decentralized-identity/did-traits/issues)

~ [Commit history](https://github.com/decentralized-identity/did-traits/commits/main)

Except where otherwise noted, this work by the [Decentralized Identity Foundation](https://identity.foundation/) is
licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0).

## Abstract

This document guides implementers of [W3C Decentralized Identifiers (DIDs)](https://w3c.github.io/did-core/) in
selecting suitable DID methods for their specific use cases by defining proven and relevant Decentralized Identifiers
traits. It includes a JSON schema for representing traits of a concrete DID method in a structured, machine-readable
format, enabling integration with third-party systems such as DID resolvers. This specification builds upon existing
literature and specifications detailed in the [References](#references) section.

## Status of This Document

This is a draft specification being developed within the
[Decentralized Identity Foundation](https://identity.foundation) (DIF). Design work is ongoing, and participants are
encouraged to open issues or otherwise contribute at
[the DIF-hosted github repository](https://github.com/decentralized-identity/did-traits), whether as input to stable
versions or as recommendations for future versions.

## Terminology

[[def:Decentralized Identifiers, Decentralized Identifier, DID]] ~ Unique ID URI string and PKI metadata document format
for describing the cryptographic keys and other fundamental PKI values linked to a unique, user-controlled,
self-sovereign identifier in a target system (i.e. blockchain, distributed ledger).

[[def:Traits, Trait]] ~ A distinct, measurable characteristic of a Decentralized Identifier method that influences its
behavior, capabilities, or implementation requirements.

## Structure of this Document

This specification is organized into three main sections:

1. [Definition of Traits](#definition-of-traits): Provides detailed definitions and descriptions of identified DID
   method traits. Each trait is explained in terms of its significance, characteristics, and impact on DID method
   implementation and usage.
2. [JSON Schema Data Model](#json-schema-data-model): Presents a formal schema for representing DID method traits in a
   machine-readable format. This section includes the complete JSON schema definition along with examples illustrating
   its application.
3. [Comparison of DID Methods](#comparison-of-did-methods): Contains a comprehensive table comparing different DID
   methods based on their traits. This comparison enables implementers to evaluate and select DID methods that best
   match their requirements.

The specification references supporting literature and related specifications throughout these sections, with complete
references provided at the end of the document.

## Definition of Traits

This section systematically defines the characteristics that distinguish and differentiate DID methods. While all DID
methods fundamentally support core operations for creating and retrieving DID documents, they exhibit diverse additional
traits that reflect their unique design. These traits have been identified through analysis of existing DID methods and
their real-world implementations. Each trait definition includes its name and description.

<!--
Generated with ../generate-markdown-table-traits.nu
-->

| Trait                                                                                             | Definition                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <a id="updateable">Updateable</a>                                                                 | DID Documents are updateable, see https://w3c.github.io/did-core/#method-operations.                                                                                                                                                                                                                                                                                                                                                               |
| <a id="updateableServiceEndpoints">Updateable Service Endpoints</a>                               | Service endpoints are updateable, see https://w3c.github.io/did-core/#services.                                                                                                                                                                                                                                                                                                                                                                    |
| <a id="deactivatable">Deactivatable</a>                                                           | DIDs are deactivatable, see https://w3c.github.io/did-core/#method-operations.                                                                                                                                                                                                                                                                                                                                                                     |
| <a id="deletable">Deletable</a>                                                                   | DID method's capability to permanently remove a DID and its associated DID document from the underlying system, rendering the identifier and its historical irresolvable.                                                                                                                                                                                                                                                                          |
| <a id="transactionalFees">Transactional Fees</a>                                                  | Indicates whether a DID method imposes mandatory transactional costs for creating, updating, or deactivating identifiers. These fees are typically associated with blockchain or distributed ledger-based methods, where computational resources and network consensus mechanisms necessitate economic compensation.                                                                                                                               |
| <a id="selfCertifying">Self-Certifying</a>                                                        | DID method where the cryptographic material used to generate the DID is embedded within the identifier itself, creating an inherent and verifiable cryptographic binding between the DID, its initial DID document, and the associated cryptographic keys. This approach eliminates the need for external verification infrastructure, as the identifier's authenticity can be cryptographically validated through its own intrinsic key material. |
| <a id="updateableVerificationMethods">Rotatable Verification Methods</a>                          | Verification methods are updateable, allowing cryptographic keys to be replaced or updated, see https://w3c.github.io/did-core/#verification-methods.                                                                                                                                                                                                                                                                                              |
| <a id="prerotationOfKeys">Pre-rotation of Keys</a>                                                | Cryptographic mechanism that enables a DID controller to securely commit to a future key rotation without revealing the actual replacement public key. This technique creates a verifiable, one-way commitment to the next cryptographic key pair, preventing malicious actors who compromise the current private key from arbitrarily rotating to a new key of their choosing.                                                                    |
| <a id="multisigVerificationMethod">Multi-Signature Verification Method</a>                        | A DID method that supports distributed control of a decentralized identifier through a cryptographic mechanism requiring multiple independent signatures to authorize critical identity operations such as updating, deactivating or using the DID.                                                                                                                                                                                                |
| <a id="humanreadable">Human-readable</a>                                                          | A DID method's ability to generate identifiers that are cognitively accessible and memorable to humans, typically incorporating meaningful, domain-specific, or intuitive components.                                                                                                                                                                                                                                                              |
| <a id="enumerable">Enumerable</a>                                                                 | A DID method where all identifiers within the system can be comprehensively discovered and listed through a publicly accessible registry, typically implemented using a distributed ledger technology (DLT) or similar transparent infrastructure.                                                                                                                                                                                                 |
| <a id="resolvableLocally">Locally Resolvable</a>                                                  | A DID method where identifiers and their associated DID documents are resolvable and verifiable only within a specific, transient local context.                                                                                                                                                                                                                                                                                                   |
| <a id="resolvableGlobally">Globally Resolvable</a>                                                | A DID method where identifiers can be resolved from any network location, enabling universal access to the associated DID document across diverse computational environments and geographic boundaries.                                                                                                                                                                                                                                            |
| <a id="history">DID Document History</a>                                                          | A DID method's capability to preserve and retrieve previous versions of a DID document, enabling comprehensive historical traceability of identity metadata and modifications.                                                                                                                                                                                                                                                                     |
| <a id="historySigned">Cryptograhpically signed DID Document History</a>                           | A DID method's capability to record all modifications to the DID document in an append-only, cryptographically verifiable data structure that prevents retroactive alteration or deletion of historical states.                                                                                                                                                                                                                                    |
| <a id="hostingNotRequired">Hosting not required</a>                                               | DID document hosting on persistent storage is not required, at least for the initial DID document. For example: did:key and did:peer.                                                                                                                                                                                                                                                                                                              |
| <a id="hostedCentrally">Centrally Hosted</a>                                                      | DID document is stored and managed and resolved through a single, centralized service infrastructure, typically implemented using a web server or controlled repository.                                                                                                                                                                                                                                                                           |
| <a id="hostedDecentrally">Decentrally Hosted</a>                                                  | DID document is stored, managed, and resolved through a distributed infrastructure, typically implemented using decentralized ledger technologies (DLT) or peer-to-peer networks.                                                                                                                                                                                                                                                                  |
| <a id="dataProtectionCompliant">Data Protection-compliant</a>                                     | A DID method's ability to fully adhere to data protection regulation requirements, ensuring comprehensive protection of personal data and individual privacy rights. For example: GDPR (EU), LGPD (Brasil), DPDP (India).                                                                                                                                                                                                                          |
| <a id="cryptographyPrivacyPreservingBBSPlus">Privacy Preserving Crypto - BBS+</a>                 | A DID method’s ability to use cryptographic techniques that enable identity verification and authentication while minimizing the disclosure of sensitive personal information. Specifically by using the Selective Disclosure techniques of the BBS+ scheme as standardized in the IETF CFRG https://datatracker.ietf.org/doc/draft-irtf-cfrg-bbs-signatures/.                                                                                     |
| <a id="cryptographyPrivacyPreservingNiZKPs">Privacy Preserving Crypto - niZKPs</a>                | A DID method’s ability to use cryptographic techniques that enable identity verification and authentication while minimizing the disclosure of sensitive personal information. Using other cryptography that supports Non-interactive Zero Knowledge Proofs (niZKPs) such as zk-SNARKS, zk-STARKS, Bulletproofs or other similar zero knowledge protocol types.                                                                                    |
| <a id="cryptographyGovernmentApprovedARE">United Arab Emirates TDRA-approved Cryptography</a>     | A DID method that implements cryptographic algorithms and protocols that are explicitly validated and recommended the national cryptographic standards body.                                                                                                                                                                                                                                                                                       |
| <a id="cryptographyGovernmentApprovedAUS">Australia ASD-approved Cryptography</a>                 | A DID method that implements cryptographic algorithms and protocols that are explicitly validated and recommended the national cryptographic standards body.                                                                                                                                                                                                                                                                                       |
| <a id="cryptographyGovernmentApprovedBRA">Brasil ICP-approved Cryptography</a>                    | A DID method that implements cryptographic algorithms and protocols that are explicitly validated and recommended the national cryptographic standards body.                                                                                                                                                                                                                                                                                       |
| <a id="cryptographyGovernmentApprovedCAN">Canada CSE-approved Cryptography</a>                    | A DID method that implements cryptographic algorithms and protocols that are explicitly validated and recommended the national cryptographic standards body.                                                                                                                                                                                                                                                                                       |
| <a id="cryptographyGovernmentApprovedCHN">China SM-approved Cryptography</a>                      | A DID method that implements cryptographic algorithms and protocols that are explicitly validated and recommended the national cryptographic standards body.                                                                                                                                                                                                                                                                                       |
| <a id="cryptographyGovernmentApprovedEU">European Union ETSI/ENISA-approved Cryptography</a>      | A DID method that implements cryptographic algorithms and protocols that are explicitly validated and recommended the national cryptographic standards body.                                                                                                                                                                                                                                                                                       |
| <a id="cryptographyGovernmentApprovedIND">India CCA-approved Cryptography</a>                     | A DID method that implements cryptographic algorithms and protocols that are explicitly validated and recommended the national cryptographic standards body.                                                                                                                                                                                                                                                                                       |
| <a id="cryptographyGovernmentApprovedISR">Israel SCALPEL-approved Cryptography</a>                | A DID method that implements cryptographic algorithms and protocols that are explicitly validated and recommended the national cryptographic standards body.                                                                                                                                                                                                                                                                                       |
| <a id="cryptographyGovernmentApprovedJPN">Japan CRYPTREC-approved Cryptography</a>                | A DID method that implements cryptographic algorithms and protocols that are explicitly validated and recommended the national cryptographic standards body.                                                                                                                                                                                                                                                                                       |
| <a id="cryptographyGovernmentApprovedKOR">South Korea KCMVP-approved Cryptography</a>             | A DID method that implements cryptographic algorithms and protocols that are explicitly validated and recommended the national cryptographic standards body.                                                                                                                                                                                                                                                                                       |
| <a id="cryptographyGovernmentApprovedRUS">Russia GOST-approved Cryptography</a>                   | A DID method that implements cryptographic algorithms and protocols that are explicitly validated and recommended the national cryptographic standards body.                                                                                                                                                                                                                                                                                       |
| <a id="cryptographyGovernmentApprovedUSA">United States of America NIST-approved Cryptography</a> | A DID method that implements cryptographic algorithms and protocols that are explicitly validated and recommended the national cryptographic standards body.                                                                                                                                                                                                                                                                                       |

## JSON Schema Data Model

The specification defines a normative JSON Schema data model for documenting and representing DID method traits in a
machine-readable format. The canonical schema is formally defined at
<https://identity.foundation/did-traits/schemas/traits.json>.

DID method authors SHALL use this schema to describe their method's trait support. The schema is structured with two
primary components:

- A `name` property of type string identifying the specific DID method.
- Traits properties of type boolean.

All traits are represented as boolean values with the following semantics:

- `true` indicates explicit support for the corresponding trait
- `false` explicitly indicates non-support of the trait.
- Omission of a trait property is equivalent to `false`.

Conforming implementations MUST validate their trait documentation against this JSON Schema, ensuring consistent and
unambiguous representation of DID method capabilities.

### Example

This example demonstrates a complete JSON representation of the did:web DID method, illustrating the schema's structure.

<!--
See ../examples/web.json
-->

```json
{
  "$schema": "https://identity.foundation/did-traits/schemas/traits.json",
  "name": "key",
  "updateable": false,
  "updateableServiceEndpoints": false,
  "deactivatable": false,
  "deletable": false,
  "transactionalFees": false,
  "selfCertifying": true,
  "updateableVerificationMethods": false,
  "prerotationOfKeys": false,
  "multisigVerificationMethod": false,
  "humanreadable": false,
  "enumerable": false,
  "resolvableLocally": false,
  "resolvableGlobally": true,
  "history": false,
  "historySigned": false,
  "hostingNotRequired": true,
  "hostedCentrally": false,
  "hostedDecentrally": false,
  "dataProtectionCompliant": false,
  "cryptographyPrivacyPreservingBBSPlus": false,
  "cryptographyPrivacyPreservingNiZKPs": false,
  "cryptographyGovernmentApprovedARE": false,
  "cryptographyGovernmentApprovedAUS": false,
  "cryptographyGovernmentApprovedBRA": false,
  "cryptographyGovernmentApprovedCAN": false,
  "cryptographyGovernmentApprovedCHN": false,
  "cryptographyGovernmentApprovedEU": false,
  "cryptographyGovernmentApprovedIND": false,
  "cryptographyGovernmentApprovedISR": false,
  "cryptographyGovernmentApprovedJPN": false,
  "cryptographyGovernmentApprovedKOR": false,
  "cryptographyGovernmentApprovedRUS": false,
  "cryptographyGovernmentApprovedUSA": false
}
```

## Comparison of DID Methods

The following table provides a comprehensive overview of trait support across multiple DID methods, enabling a
systematic comparison of their capabilities.

<!--
Generated via ../generate-markdown-table-comparison.nu
-->

| Trait                                                                                     | [did:key](https://www.w3.org/TR/did-extensions-methods/#did-methods) | [did:peer](https://www.w3.org/TR/did-extensions-methods/#did-methods) | [did:web](https://www.w3.org/TR/did-extensions-methods/#did-methods) | [did:webvh](https://www.w3.org/TR/did-extensions-methods/#did-methods) |
| ----------------------------------------------------------------------------------------- | -------------------------------------------------------------------- | --------------------------------------------------------------------- | -------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Trait                                                                                     | [did:key](https://www.w3.org/TR/did-extensions-methods/#did-methods) | [did:peer](https://www.w3.org/TR/did-extensions-methods/#did-methods) | [did:web](https://www.w3.org/TR/did-extensions-methods/#did-methods) | [did:webvh](https://www.w3.org/TR/did-extensions-methods/#did-methods) |
| [Updateable](#updateable)                                                                 |                                                                      | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| [Updateable Service Endpoints](#updateableServiceEndpoints)                               |                                                                      | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| [Deactivatable](#deactivatable)                                                           |                                                                      |                                                                       | ✅                                                                   | ✅                                                                     |
| [Deletable](#deletable)                                                                   |                                                                      |                                                                       | ✅                                                                   | ✅                                                                     |
| [Transactional Fees](#transactionalFees)                                                  |                                                                      |                                                                       |                                                                      |                                                                        |
| [Self-Certifying](#selfCertifying)                                                        | ✅                                                                   | ✅                                                                    |                                                                      | ✅                                                                     |
| [Rotatable Verification Methods](#updateableVerificationMethods)                          |                                                                      | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| [Pre-rotation of Keys](#prerotationOfKeys)                                                |                                                                      |                                                                       |                                                                      | ✅                                                                     |
| [Multi-Signature Verification Method](#multisigVerificationMethod)                        |                                                                      |                                                                       |                                                                      |                                                                        |
| [Human-readable](#humanreadable)                                                          |                                                                      |                                                                       | ✅                                                                   |                                                                        |
| [Enumerable](#enumerable)                                                                 |                                                                      |                                                                       |                                                                      |                                                                        |
| [Locally Resolvable](#resolvableLocally)                                                  |                                                                      | ✅                                                                    |                                                                      |                                                                        |
| [Globally Resolvable](#resolvableGlobally)                                                | ✅                                                                   |                                                                       | ✅                                                                   | ✅                                                                     |
| [DID Document History](#history)                                                          |                                                                      |                                                                       |                                                                      | ✅                                                                     |
| [Cryptograhpically signed DID Document History](#historySigned)                           |                                                                      |                                                                       |                                                                      | ✅                                                                     |
| [Hosting not required](#hostingNotRequired)                                               | ✅                                                                   | ✅                                                                    |                                                                      | ✅                                                                     |
| [Centrally Hosted](#hostedCentrally)                                                      |                                                                      |                                                                       | ✅                                                                   | ✅                                                                     |
| [Decentrally Hosted](#hostedDecentrally)                                                  |                                                                      |                                                                       |                                                                      |                                                                        |
| [Data Protection-compliant](#dataProtectionCompliant)                                     |                                                                      |                                                                       |                                                                      |                                                                        |
| [Privacy Preserving Crypto - BBS+](#cryptographyPrivacyPreservingBBSPlus)                 |                                                                      |                                                                       | ✅                                                                   | ✅                                                                     |
| [Privacy Preserving Crypto - niZKPs](#cryptographyPrivacyPreservingNiZKPs)                |                                                                      |                                                                       | ✅                                                                   | ✅                                                                     |
| [United Arab Emirates TDRA-approved Cryptography](#cryptographyGovernmentApprovedARE)     |                                                                      |                                                                       |                                                                      |                                                                        |
| [Australia ASD-approved Cryptography](#cryptographyGovernmentApprovedAUS)                 |                                                                      |                                                                       |                                                                      |                                                                        |
| [Brasil ICP-approved Cryptography](#cryptographyGovernmentApprovedBRA)                    |                                                                      |                                                                       |                                                                      |                                                                        |
| [Canada CSE-approved Cryptography](#cryptographyGovernmentApprovedCAN)                    |                                                                      |                                                                       |                                                                      |                                                                        |
| [China SM-approved Cryptography](#cryptographyGovernmentApprovedCHN)                      |                                                                      |                                                                       |                                                                      |                                                                        |
| [European Union ETSI/ENISA-approved Cryptography](#cryptographyGovernmentApprovedEU)      |                                                                      |                                                                       |                                                                      |                                                                        |
| [India CCA-approved Cryptography](#cryptographyGovernmentApprovedIND)                     |                                                                      |                                                                       |                                                                      |                                                                        |
| [Israel SCALPEL-approved Cryptography](#cryptographyGovernmentApprovedISR)                |                                                                      |                                                                       |                                                                      |                                                                        |
| [Japan CRYPTREC-approved Cryptography](#cryptographyGovernmentApprovedJPN)                |                                                                      |                                                                       |                                                                      |                                                                        |
| [South Korea KCMVP-approved Cryptography](#cryptographyGovernmentApprovedKOR)             |                                                                      |                                                                       |                                                                      |                                                                        |
| [Russia GOST-approved Cryptography](#cryptographyGovernmentApprovedRUS)                   |                                                                      |                                                                       |                                                                      |                                                                        |
| [United States of America NIST-approved Cryptography](#cryptographyGovernmentApprovedUSA) |                                                                      |                                                                       |                                                                      |                                                                        |

## Appendix

### Relate Specifications and Research

- [DID Method Rubric](https://www.w3.org/TR/did-rubric/): A core inspiration for this work. The focus is wider, e.g.
  covering privacy, resource consumption and adoption, and less focused on concrete tangible feature differences.
  - [Methods for Decentralized Identities: Evaluation and Insights](https://eprint.iacr.org/2021/1087.pdf): Application
    of the DID Method Rubric to selected DID methods. See page 15 for the resulting comparison matrix.
- [A Taxonomy of Decentralized Identifier Methods for Practitioners](https://arxiv.org/pdf/2311.03367): Another core
  inspiration. The paper puts forward a comparison matrix with lots of sub-traits per category. Important newer traits
  are missing.
- [SpruceID Ugradeable Decentralized Identity - DID Method Traits](https://blog.spruceid.com/upgradeable-decentralized-identity/):
  Proposal from 2022 to produce a list of DID Method Traits. The list wasn't create, however a number of traits are
  proposed in the blog post.
- [OWF](https://openwallet-foundation.github.io/digital-wallet-and-agent-overviews-sig/#/resources/Key%20Management)
- [DID Enumeration](https://hackmd.io/qz2Mbx7_RuOVLf9YQnz_rA?view)
- [ToIP DID Utility Comparison](https://docs.google.com/spreadsheets/d/18MpvpFPLjL2I7RSFI44heWrrvf3l9pAArzhznAPFVAQ/edit?gid=0#gid=0)
- [DID:X Continued: The Perfect DID Method?](https://decentralgabe.xyz/did-x-continued-the-perfect-did-method/)

## References

### Normative References

[[spec]]

### Informative References

[[def:JSON Schema]]
~ [JSON Schema: A Media Type for Describing JSON Documents](https://json-schema.org/draft/2020-12/json-schema-core.html).
A. Wright, H. Andrews, B. Hutton, G. Dennis. Status: 28 January 2020. Status: Internet-Draft.

## Patent Policy

The Decentralized Identity Foundation has adopted the W3C Patent Policy (2004), as detailed below:

- **Licensing Commitment.** Each contributor agrees to make available any of its Essential Claims, as defined in the W3C
  Patent Policy (available at http://www.w3.org/Consortium/Patent-Policy-20040205), under the W3C RF licensing
  requirements Section 5 (http://www.w3.org/Consortium/Patent-Policy-20040205), as if the contribution was contained in
  or associated with a W3C Recommendation.

- **For Exclusion.** Prior to committing any code, bug reports, pull requests, or other forms of contribution, a
  contributor may exclude Essential Claims from its licensing commitments under this agreement by providing written
  notice of that intent to DIF's Executive Director (and must received confirmation of receipt for the exclusion to have
  effect). The Exclusion Notice for issued patents and published applications must include the patent number(s) or title
  and application number(s), as the case may be, for each of the issued patent(s) or pending patent application(s) that
  the contributor wishes to exclude from the licensing commitment set forth in Section 1 of this patent policy. If an
  issued patent or pending patent application that may contain Essential Claims is not set forth in the Exclusion
  Notice, those Essential Claims shall continue to be subject to the licensing commitments under this agreement. The
  Exclusion Notice for unpublished patent applications must provide either: (i) the text of the filed application; or
  (ii) identification of the specific part(s) of the contribution whose implementation makes the excluded claim an
  Essential Claim. If (ii) is chosen, the effect of the exclusion will be limited to the identified part(s) of the
  contribution. DIF's Executive Director will publish Exclusion Notices.

## Acknowledgements

We thank the Decentralized Identity Foundation and the Identity and Discovery working group for their support in this
specification.
