class BeaconBlockHeader {
  final int slot;
  final int proposerIndex;
  final String parentRoot;
  final String stateRoot;
  final String bodyRoot;

  BeaconBlockHeader(
      {required this.slot,
      required this.proposerIndex,
      required this.parentRoot,
      required this.stateRoot,
      required this.bodyRoot});
}

class ExecutionPayloadHeader {
  final String parentHash;
  final String feeRecipient;
  final String stateRoot;
  final String receiptsRoot;
  final String logsBloom;
  final String prevRandao;
  final int blockNumber;
  final int gasLimit;
  final int gasUsed;
  final int timestamp;
  final String extraData;
  final int baseFeePerGas;
  final String blockHash;
  final String transactionsRoot;
  final String withdrawalsRoot;
  final int blobGasUsed;
  final int excessBlobGas;

  ExecutionPayloadHeader(
      {required this.parentHash,
      required this.feeRecipient,
      required this.stateRoot,
      required this.receiptsRoot,
      required this.logsBloom,
      required this.prevRandao,
      required this.blockNumber,
      required this.gasLimit,
      required this.gasUsed,
      required this.timestamp,
      required this.extraData,
      required this.baseFeePerGas,
      required this.blockHash,
      required this.transactionsRoot,
      required this.withdrawalsRoot,
      required this.blobGasUsed,
      required this.excessBlobGas});
}

class ExecutionBranch {
  final List<String> branch;

  ExecutionBranch({required this.branch});
}
