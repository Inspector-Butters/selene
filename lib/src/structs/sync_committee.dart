class SyncCommittee {
  final List<String> pubkeys;

  SyncCommittee({required this.pubkeys});

  String hashTreeRoot() {
    throw UnimplementedError();
  }
}

class SyncCommitteeBranch {
  final List<String> branch;

  SyncCommitteeBranch({required this.branch});
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
