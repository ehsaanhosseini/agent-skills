# Secret lifecycle and exposure review

Prefer platform secret stores or short-lived workload identity to long-lived shared credentials. Scope access to service and environment. Plan issuance, distribution, use, rotation overlap, revocation and audit. Review logs, traces, exception handlers, crash dumps, test fixtures, build args, CI artifacts and IaC state for exposure routes. Marking a Terraform value `sensitive` can hide display but does not necessarily remove it from state; see [HashiCorp guidance](https://developer.hashicorp.com/terraform/language/manage-sensitive-data).

Example rotation: create a second credential with equivalent narrow permissions, deploy consumers to accept it, verify successful use and absence of old credential traffic, then revoke the old one after a bounded overlap. Test the case where the new credential fails before revocation. Do not paste either value into a ticket or PR. If exposure is suspected, coordinate incident response, revoke through the owner and assess logs/artifacts; deleting a line from Git does not revoke a leaked token.

Report secret names and control status only. If validation requires inspecting a real value, stop and request the authorized operator and secure channel rather than retrieving it through a general-purpose agent.
