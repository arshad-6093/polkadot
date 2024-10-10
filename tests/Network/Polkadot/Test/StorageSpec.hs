{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

-- |
-- Module      :  Network.Polkadot.Test.StorageSpec
-- Copyright   :  Aleksandr Krupenkin 2016-2024
-- License     :  Apache-2.0
--
-- Maintainer  :  mail@akru.me
-- Stability   :  experimental
-- Portability :  unportable
--
--

module Network.Polkadot.Test.StorageSpec where

import           Codec.Scale                 (decode)
import           Data.ByteArray.HexString.TH (hexFrom)
import           Test.Hspec

import           Network.Polkadot.Metadata   (Metadata, metadataTypes, toLatest)
import           Network.Polkadot.Storage    (fromMetadata)

spec :: Spec
spec = parallel $ do
    describe "Metadata Storage" $ do
        it "decode and parse storage entries" $ do
            let (Right hex) = decode [hexFrom|tests/meta/v13.hex|] :: Either String Metadata
                (meta, _) = metadataTypes hex
            show (fromMetadata (toLatest meta)) `shouldBe` "fromList [(\"assets\",fromList [(\"account\",DoubleMapEntry),(\"approvals\",NMapEntry),(\"asset\",MapEntry),(\"metadata\",MapEntry)]),(\"authorship\",fromList [(\"author\",PlainEntry),(\"didSetUncles\",PlainEntry),(\"uncles\",PlainEntry)]),(\"babe\",fromList [(\"authorVrfRandomness\",PlainEntry),(\"authorities\",PlainEntry),(\"currentSlot\",PlainEntry),(\"epochConfig\",PlainEntry),(\"epochIndex\",PlainEntry),(\"epochStart\",PlainEntry),(\"genesisSlot\",PlainEntry),(\"initialized\",PlainEntry),(\"lateness\",PlainEntry),(\"nextAuthorities\",PlainEntry),(\"nextEpochConfig\",PlainEntry),(\"nextRandomness\",PlainEntry),(\"pendingEpochConfigChange\",PlainEntry),(\"randomness\",PlainEntry),(\"segmentIndex\",PlainEntry),(\"underConstruction\",MapEntry)]),(\"balances\",fromList [(\"account\",MapEntry),(\"locks\",MapEntry),(\"reserves\",MapEntry),(\"storageVersion\",PlainEntry),(\"totalIssuance\",PlainEntry)]),(\"bounties\",fromList [(\"bounties\",MapEntry),(\"bountyApprovals\",PlainEntry),(\"bountyCount\",PlainEntry),(\"bountyDescriptions\",MapEntry)]),(\"contracts\",fromList [(\"accountCounter\",PlainEntry),(\"codeStorage\",MapEntry),(\"contractInfoOf\",MapEntry),(\"deletionQueue\",PlainEntry),(\"pristineCode\",MapEntry)]),(\"council\",fromList [(\"members\",PlainEntry),(\"prime\",PlainEntry),(\"proposalCount\",PlainEntry),(\"proposalOf\",MapEntry),(\"proposals\",PlainEntry),(\"voting\",MapEntry)]),(\"democracy\",fromList [(\"blacklist\",MapEntry),(\"cancellations\",MapEntry),(\"depositOf\",MapEntry),(\"lastTabledWasExternal\",PlainEntry),(\"locks\",MapEntry),(\"lowestUnbaked\",PlainEntry),(\"nextExternal\",PlainEntry),(\"preimages\",MapEntry),(\"publicPropCount\",PlainEntry),(\"publicProps\",PlainEntry),(\"referendumCount\",PlainEntry),(\"referendumInfoOf\",MapEntry),(\"storageVersion\",PlainEntry),(\"votingOf\",MapEntry)]),(\"electionProviderMultiPhase\",fromList [(\"currentPhase\",PlainEntry),(\"desiredTargets\",PlainEntry),(\"minimumUntrustedScore\",PlainEntry),(\"queuedSolution\",PlainEntry),(\"round\",PlainEntry),(\"signedSubmissionIndices\",PlainEntry),(\"signedSubmissionNextIndex\",PlainEntry),(\"signedSubmissionsMap\",MapEntry),(\"snapshot\",PlainEntry),(\"snapshotMetadata\",PlainEntry)]),(\"elections\",fromList [(\"candidates\",PlainEntry),(\"electionRounds\",PlainEntry),(\"members\",PlainEntry),(\"runnersUp\",PlainEntry),(\"voting\",MapEntry)]),(\"gilt\",fromList [(\"active\",MapEntry),(\"activeTotal\",PlainEntry),(\"queueTotals\",PlainEntry),(\"queues\",MapEntry)]),(\"grandpa\",fromList [(\"currentSetId\",PlainEntry),(\"nextForced\",PlainEntry),(\"pendingChange\",PlainEntry),(\"setIdSession\",MapEntry),(\"stalled\",PlainEntry),(\"state\",PlainEntry)]),(\"identity\",fromList [(\"identityOf\",MapEntry),(\"registrars\",PlainEntry),(\"subsOf\",MapEntry),(\"superOf\",MapEntry)]),(\"imOnline\",fromList [(\"authoredBlocks\",DoubleMapEntry),(\"heartbeatAfter\",PlainEntry),(\"keys\",PlainEntry),(\"receivedHeartbeats\",DoubleMapEntry)]),(\"indices\",fromList [(\"accounts\",MapEntry)]),(\"lottery\",fromList [(\"callIndices\",PlainEntry),(\"lottery\",PlainEntry),(\"lotteryIndex\",PlainEntry),(\"participants\",MapEntry),(\"tickets\",MapEntry),(\"ticketsCount\",PlainEntry)]),(\"mmr\",fromList [(\"nodes\",MapEntry),(\"numberOfLeaves\",PlainEntry),(\"rootHash\",PlainEntry)]),(\"multisig\",fromList [(\"calls\",MapEntry),(\"multisigs\",DoubleMapEntry)]),(\"offences\",fromList [(\"concurrentReportsIndex\",DoubleMapEntry),(\"reports\",MapEntry),(\"reportsByKindIndex\",MapEntry)]),(\"proxy\",fromList [(\"announcements\",MapEntry),(\"proxies\",MapEntry)]),(\"randomnessCollectiveFlip\",fromList [(\"randomMaterial\",PlainEntry)]),(\"recovery\",fromList [(\"activeRecoveries\",DoubleMapEntry),(\"proxy\",MapEntry),(\"recoverable\",MapEntry)]),(\"scheduler\",fromList [(\"agenda\",MapEntry),(\"lookup\",MapEntry),(\"storageVersion\",PlainEntry)]),(\"session\",fromList [(\"currentIndex\",PlainEntry),(\"disabledValidators\",PlainEntry),(\"keyOwner\",MapEntry),(\"nextKeys\",MapEntry),(\"queuedChanged\",PlainEntry),(\"queuedKeys\",PlainEntry),(\"validators\",PlainEntry)]),(\"society\",fromList [(\"bids\",PlainEntry),(\"candidates\",PlainEntry),(\"defender\",PlainEntry),(\"defenderVotes\",MapEntry),(\"founder\",PlainEntry),(\"head\",PlainEntry),(\"maxMembers\",PlainEntry),(\"members\",PlainEntry),(\"payouts\",MapEntry),(\"pot\",PlainEntry),(\"rules\",PlainEntry),(\"strikes\",MapEntry),(\"suspendedCandidates\",MapEntry),(\"suspendedMembers\",MapEntry),(\"votes\",DoubleMapEntry),(\"vouching\",MapEntry)]),(\"staking\",fromList [(\"activeEra\",PlainEntry),(\"bonded\",MapEntry),(\"bondedEras\",PlainEntry),(\"canceledSlashPayout\",PlainEntry),(\"chillThreshold\",PlainEntry),(\"counterForNominators\",PlainEntry),(\"counterForValidators\",PlainEntry),(\"currentEra\",PlainEntry),(\"currentPlannedSession\",PlainEntry),(\"earliestUnappliedSlash\",PlainEntry),(\"erasRewardPoints\",MapEntry),(\"erasStakers\",DoubleMapEntry),(\"erasStakersClipped\",DoubleMapEntry),(\"erasStartSessionIndex\",MapEntry),(\"erasTotalStake\",MapEntry),(\"erasValidatorPrefs\",DoubleMapEntry),(\"erasValidatorReward\",MapEntry),(\"forceEra\",PlainEntry),(\"historyDepth\",PlainEntry),(\"invulnerables\",PlainEntry),(\"ledger\",MapEntry),(\"maxNominatorsCount\",PlainEntry),(\"maxValidatorsCount\",PlainEntry),(\"minNominatorBond\",PlainEntry),(\"minValidatorBond\",PlainEntry),(\"minimumValidatorCount\",PlainEntry),(\"nominatorSlashInEra\",DoubleMapEntry),(\"nominators\",MapEntry),(\"payee\",MapEntry),(\"slashRewardFraction\",PlainEntry),(\"slashingSpans\",MapEntry),(\"spanSlash\",MapEntry),(\"storageVersion\",PlainEntry),(\"unappliedSlashes\",MapEntry),(\"validatorCount\",PlainEntry),(\"validatorSlashInEra\",DoubleMapEntry),(\"validators\",MapEntry)]),(\"sudo\",fromList [(\"key\",PlainEntry)]),(\"system\",fromList [(\"account\",MapEntry),(\"allExtrinsicsLen\",PlainEntry),(\"blockHash\",MapEntry),(\"blockWeight\",PlainEntry),(\"digest\",PlainEntry),(\"eventCount\",PlainEntry),(\"eventTopics\",MapEntry),(\"events\",PlainEntry),(\"executionPhase\",PlainEntry),(\"extrinsicCount\",PlainEntry),(\"extrinsicData\",MapEntry),(\"lastRuntimeUpgrade\",PlainEntry),(\"number\",PlainEntry),(\"parentHash\",PlainEntry),(\"upgradedToTripleRefCount\",PlainEntry),(\"upgradedToU32RefCount\",PlainEntry)]),(\"technicalCommittee\",fromList [(\"members\",PlainEntry),(\"prime\",PlainEntry),(\"proposalCount\",PlainEntry),(\"proposalOf\",MapEntry),(\"proposals\",PlainEntry),(\"voting\",MapEntry)]),(\"technicalMembership\",fromList [(\"members\",PlainEntry),(\"prime\",PlainEntry)]),(\"timestamp\",fromList [(\"didUpdate\",PlainEntry),(\"now\",PlainEntry)]),(\"tips\",fromList [(\"reasons\",MapEntry),(\"tips\",MapEntry)]),(\"transactionPayment\",fromList [(\"nextFeeMultiplier\",PlainEntry),(\"storageVersion\",PlainEntry)]),(\"transactionStorage\",fromList [(\"blockTransactions\",PlainEntry),(\"byteFee\",PlainEntry),(\"chunkCount\",MapEntry),(\"entryFee\",PlainEntry),(\"maxBlockTransactions\",PlainEntry),(\"maxTransactionSize\",PlainEntry),(\"proofChecked\",PlainEntry),(\"storagePeriod\",PlainEntry),(\"transactions\",MapEntry)]),(\"treasury\",fromList [(\"approvals\",PlainEntry),(\"proposalCount\",PlainEntry),(\"proposals\",MapEntry)]),(\"uniques\",fromList [(\"account\",NMapEntry),(\"asset\",DoubleMapEntry),(\"attribute\",NMapEntry),(\"class\",MapEntry),(\"classMetadataOf\",MapEntry),(\"instanceMetadataOf\",DoubleMapEntry)]),(\"vesting\",fromList [(\"vesting\",MapEntry)])]"