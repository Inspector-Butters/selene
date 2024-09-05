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
        slot: int.parse(response['slot']),
        proposerIndex: int.parse(response['proposer_index']),
        parentRoot: response['parent_root'],
        stateRoot: response['state_root'],
        bodyRoot: response['body_root']);
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
        parentHash: response['parent_hash'],
        feeRecipient: response['fee_recipient'],
        stateRoot: response['state_root'],
        receiptsRoot: response['receipts_root'],
        logsBloom: response['logs_bloom'],
        prevRandao: response['prev_randao'],
        blockNumber: int.parse(response['block_number']),
        gasLimit: int.parse(response['gas_limit']),
        gasUsed: int.parse(response['gas_used']),
        timestamp: int.parse(response['timestamp']),
        extraData: response['extra_data'],
        baseFeePerGas: int.parse(response['base_fee_per_gas']),
        blockHash: response['block_hash'],
        transactionsRoot: response['transactions_root'],
        withdrawalsRoot: response['withdrawals_root'],
        blobGasUsed: int.parse(response['blob_gas_used']),
        excessBlobGas: int.parse(response['excess_blob_gas']));
  }
}

class ExecutionBranch {
  final List<String> branch;

  ExecutionBranch({required this.branch});

  static fromJson(response) {
    List<String> branchList = response.cast<String>();
    return ExecutionBranch(branch: branchList);
  }
}
