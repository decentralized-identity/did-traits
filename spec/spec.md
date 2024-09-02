# did-traits 0.1 Editor's Draft

**Specification Status:** [Pre-Draft](https://github.com/decentralized-identity/org/blob/master/work-item-lifecycle.md)

**Latest Draft:**
[identity.foundation/did-traits](https://identity.foundation/did-traits)

**Ratified Versions:**

**Editors:**

~ [Jan Christoph Ebersbach](https://www.linkedin.com/in/JCEbersbach) (identinet)

<!-- -->

**Participate:**
~ [GitHub repo](https://github.com/decentralized-identity/did-traits)
~ [File a bug](https://github.com/decentralized-identity/did-traits/issues)
~ [Commit history](https://github.com/decentralized-identity/did-traits/commits/main)

Except where otherwise noted, this work by the [Decentralized Identity Foundation](https://identity.foundation/) is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0).

## Abstract

The purpose of this document is to aid implementers of
[W3C Decentralized Identifiers (DIDs)](https://w3c.github.io/did-core/) in selecting the most suitable identifier for
their specific use cases. It does so by identifying and defining key traits of identifiers that have proven to be
significant. Additionally, it provides a JSON schema for DID method authors, allowing them to present the
characteristics of their DID methods in a structured and machine-readable format. This structured information can then
be utilized by third-party systems, such as DID resolvers. This work builds on existing literature and specifications,
which are detailed in the [References](#references) section.

## Status of This Document

This is a draft specification being developed within the
[Decentralized Identity Foundation](https://identity.foundation) (DIF). Design
work is ongoing, and participants are
encouraged to open issues or otherwise contribute at [the DIF-hosted github
repository](https://github.com/decentralized-identity/did-traits),
whether as input to stable versions or as recommendations for future versions.

## Terminology

[[def:Decentralized Identifiers, Decentralized Identifier, DID]]
~ Unique ID URI string and PKI metadata document format for describing the
cryptographic keys and other fundamental PKI values linked to a unique,
user-controlled, self-sovereign identifier in a target system (i.e. blockchain,
distributed ledger).

[[def:Claim, Claims]]
~ An assertion made about a [[ref:Subject]]. Used as an umbrella term for
Credential, Assertion, Attestation, etc.

## Structure of this Document

TODO

## Data Models

TODO

## Traits

| Trait                                               | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| --------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <a name="deactivatable">Deactivatable</a>           | DID Documents deactivated / deleted                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| <a name="enumerable">Enumerable</a>                 | All DIDs of this method can be enumerated, i.e. a public registry like a DLT exists that references all existing DIDs                                                                                                                                                                                                                                                                                                                                                            |
| <a name="globally">Globally resolvable</a>          | DIDs can be resolved globally, i.e. the current DID document can be resolved globally from every point as opposed to a DID that just exists in a local context                                                                                                                                                                                                                                                                                                                   |
| <a name="history">History available</a>             | Previous versions of DID document are available and can be looked up                                                                                                                                                                                                                                                                                                                                                                                                             |
| <a name="immutable">Immutable History</a>           | Changes to DID Documents are persisted in an immutable data structure, e.g. a DLT                                                                                                                                                                                                                                                                                                                                                                                                |
| <a name="human-readable">Human-readable</a>         | DID can be read and remembered by humans, e.g. `did:web:example.com:me`                                                                                                                                                                                                                                                                                                                                                                                                          |
| <a name="pre-rotation">Key Pre-Rotation</a>         | Cryptographic keys can be pre-rotated to combat key loss and attacks by quantum computers                                                                                                                                                                                                                                                                                                                                                                                        |
| <a name="modifiable">Modifiable</a>                 | DID Documents can be modified                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| <a name="self-certification">Self-Certification</a> | The initial DID Document is securely derived from the DID itself, e.g. `did:key`                                                                                                                                                                                                                                                                                                                                                                                                 |
| <a name="self-creation">Self-Creation</a>           | DID Document is generative / derived from the DID without having to access any external system, e.g. any `did:key` DID can be derived from the initial public key                                                                                                                                                                                                                                                                                                                |
| <a name="fees">Explicit Fees</a>                    | Creation, modification or deletion of identifiers trigger transaction fees, e.g. blockchain-based DID methods often require transaction fees                                                                                                                                                                                                                                                                                                                                     |
| <a name="hosting">Hosting</a>                       | What kind of hosting is require? None, centralized, decentralized.                                                                                                                                                                                                                                                                                                                                                                                                               |
| Globally dereferenceable                            | The DID method supports extensible DID URLs to external resources or to specific versions of the DID Document. - Comment by Juan: split into 3 diff ones: service-specific DID URL support, ?versionTime= support, and ?versionId= support . a surprising number of methods support 1 or 2 but not all 3!                                                                                                                                                                        |
| Rotatable                                           | The DID method supports rotation of the keys to control the DID (worth calling this out, in addition to pre-rotation, as many methods do not support) - Comment by Juan: one thing working with the KERI WG at DIF taught me was that there are like 10 different capabilities/flows that people refer to when they mean rotation. rotation in case of key exfiltration? manual rotation by controller? regular/automated rotation NOT requiring manual controller intervention? |
| Multi-sig                                           | The method supports multiple DID controllers, with multiple key signatures required to update or deactivate the DID - Comment by Juan: same-- threshold versus multisig goes all the way back to christopher allan's BTC pre-DID research and some of the oldest did-wg megathreads, worth picking carefully a definition. joe andreiu probably has something detailed written up about this somewhere.                                                                          |
| Publicly Accessible                                 | The DID method has a functional Universal Resolver AND Universal Registrar driver - Comment by Juan: should there be some kind of maintenance requirement or stalebot caveat?                                                                                                                                                                                                                                                                                                    |

## Traits by Identifier

INFO: this table is not a deliverable of this work item. It's merely an example of how a comparison table could look
like.

| Method \ Trait                                                                | [Deactivatable](#deactivatable) | [Enumerable](#enumerable) | [Globally resolvable](#globally) | [History available](#history) | [Immutable History](#immutable) | [Human-readable](#human-readable) | [Key Pre-Rotation](#pre-rotation) | [Modifiable](#modifiable) | [Self-Certification](#self-certification) | [Self-Creation](#self-creation) | [Explicit fees](#fees) |
| ----------------------------------------------------------------------------- | ------------------------------- | ------------------------- | -------------------------------- | ----------------------------- | ------------------------------- | --------------------------------- | --------------------------------- | ------------------------- | ----------------------------------------- | ------------------------------- | ---------------------- |
| [did:tdw](https://bcgov.github.io/trustdidweb/)                               | [`x`](#x)                       |                           | [`x`](#x)                        | [`x`](#x)                     | [`x`](#x)                       |                                   | [`x`](#x)                         | [`x`](#x)                 | [`x`](#x)                                 |                                 |                        |
| [did:web](https://w3c-ccg.github.io/did-method-web/)                          | [`x`](#x)                       |                           | [`x`](#x)                        |                               |                                 | [`x`](#x)                         |                                   | [`x`](#x)                 |                                           |                                 |                        |
| did:key                                                                       |                                 |                           | [`x`](#x)                        |                               |                                 |                                   |                                   |                           | [`x`](#x)                                 | [`x`](#x)                       |                        |
| did:jwk                                                                       |                                 |                           | [`x`](#x)                        |                               |                                 |                                   |                                   |                           | [`x`](#x)                                 | [`x`](#x)                       |                        |
| did:peer                                                                      |                                 |                           |                                  | [`x`](#x)                     |                                 |                                   |                                   | [`x`](#x)                 | [`x`](#x)                                 | [`x`](#x)                       |                        |
| did:dht                                                                       | [`x`](#x)                       | [`x`](#x)                 | [`x`](#x)                        | [`x`](#x)                     | [`?`](#?)                       |                                   | [`?`](#?)                         | [`x`](#x)                 | [`?`](#?)                                 | [`?`](#?)                       |                        |
| [did:webs](https://trustoverip.github.io/tswg-did-method-webs-specification/) |                                 |                           |                                  |                               |                                 |                                   |                                   |                           |                                           |                                 |                        |
| did:indy                                                                      |
| did:ebsi                                                                      |
| did:cheqd                                                                     |
| did:polygonid                                                                 |

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
- [OWF](https://openwallet-foundation.github.io/credential-format-comparison-sig/#/resources/Key%20Management)
- [DID Enumeration](https://hackmd.io/qz2Mbx7_RuOVLf9YQnz_rA?view)
- [ToIP DID Utility Comparison](https://docs.google.com/spreadsheets/d/18MpvpFPLjL2I7RSFI44heWrrvf3l9pAArzhznAPFVAQ/edit?gid=0#gid=0)
- [DID:X Continued: The Perfect DID Method?](https://decentralgabe.xyz/did-x-continued-the-perfect-did-method/)

## References

### Normative References

[[spec]]

### Informative References

[[def:JSON Schema]]
~ [JSON Schema: A Media Type for Describing JSON Documents](https://json-schema.org/draft/2020-12/json-schema-core.html).
A. Wright, H. Andrews, B. Hutton, G. Dennis. Status: 28 January 2020.
Status: Internet-Draft.

## Patent Policy

The Decentralized Identity Foundation has adopted the W3C Patent Policy (2004), as detailed below:

- **Licensing Commitment.** Each contributor agrees to make available any of its
  Essential Claims, as defined in the W3C Patent Policy (available at
  http://www.w3.org/Consortium/Patent-Policy-20040205), under the W3C RF licensing
  requirements Section 5 (http://www.w3.org/Consortium/Patent-Policy-20040205), as
  if the contribution was contained in or associated with a W3C Recommendation.

- **For Exclusion.** Prior to committing any code, bug reports, pull requests, or
  other forms of contribution, a contributor may exclude Essential Claims from its
  licensing commitments under this agreement by providing written notice of that
  intent to DIF's Executive Director (and must received confirmation of receipt
  for the exclusion to have effect). The Exclusion Notice for issued patents and
  published applications must include the patent number(s) or title and
  application number(s), as the case may be, for each of the issued patent(s) or
  pending patent application(s) that the contributor wishes to exclude from the
  licensing commitment set forth in Section 1 of this patent policy. If an issued
  patent or pending patent application that may contain Essential Claims is not
  set forth in the Exclusion Notice, those Essential Claims shall continue to be
  subject to the licensing commitments under this agreement. The Exclusion Notice
  for unpublished patent applications must provide either: (i) the text of the
  filed application; or (ii) identification of the specific part(s) of the
  contribution whose implementation makes the excluded claim an Essential Claim.
  If (ii) is chosen, the effect of the exclusion will be limited to the identified
  part(s) of the contribution. DIF's Executive Director will publish Exclusion
  Notices.

## Acknowledgements

We thank the Decentralized Identity Foundation and the Identity and Discovery working group for their support in this
specification.
