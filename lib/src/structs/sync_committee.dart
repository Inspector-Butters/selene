class SyncCommittee {
  final List<String> pubkeys;
  final String aggregatePubkey;

  SyncCommittee({required this.pubkeys, required this.aggregatePubkey});

  String hashTreeRoot() {
    throw UnimplementedError();
  }

  static fromJson(response) {
    var pubkeys = response['pubkeys'].cast<String>();
    return SyncCommittee(
      pubkeys: pubkeys,
      aggregatePubkey: response['aggregate_pubkey'],
    );
  }
}

class SyncCommitteeBranch {
  final List<String> branch;

  SyncCommitteeBranch({required this.branch});

  static fromJson(response) {
    return SyncCommitteeBranch(branch: response.cast<String>());
  }
}

class SyncAggregate {
  final String syncCommitteeBits;
  final String syncCommitteeSignature;

  SyncAggregate(
      {required this.syncCommitteeBits, required this.syncCommitteeSignature});
}

class FinalityBranch {
  final List<String> branch;

  FinalityBranch({required this.branch});
}
