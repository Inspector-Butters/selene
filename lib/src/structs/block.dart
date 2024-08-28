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

  static fromJson(response) {
    return BeaconBlockHeader(
        slot: response['slot'],
        proposerIndex: response['proposerIndex'],
        parentRoot: response['parentRoot'],
        stateRoot: response['stateRoot'],
        bodyRoot: response['bodyRoot']);
  }

  String hashTreeRoot() {
    throw UnimplementedError();
  }
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

  static fromJson(response) {
    return ExecutionPayloadHeader(
        parentHash: response['parentHash'],
        feeRecipient: response['feeRecipient'],
        stateRoot: response['stateRoot'],
        receiptsRoot: response['receiptsRoot'],
        logsBloom: response['logsBloom'],
        prevRandao: response['prevRandao'],
        blockNumber: response['blockNumber'],
        gasLimit: response['gasLimit'],
        gasUsed: response['gasUsed'],
        timestamp: response['timestamp'],
        extraData: response['extraData'],
        baseFeePerGas: response['baseFeePerGas'],
        blockHash: response['blockHash'],
        transactionsRoot: response['transactionsRoot'],
        withdrawalsRoot: response['withdrawalsRoot'],
        blobGasUsed: response['blobGasUsed'],
        excessBlobGas: response['excessBlobGas']);
  }
}

class ExecutionBranch {
  final List<String> branch;

  ExecutionBranch({required this.branch});

  static fromJson(response) {
    return ExecutionBranch(branch: response['branch']);
  }
}
