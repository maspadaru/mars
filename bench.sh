#!/bin/bash

CHASE_DATA_DIR=../starbench/benchmark/data/chase
LARS_DATA_DIR=../starbench/benchmark/data/lars
CHASE_PROGRAM_DIR=../starbench/benchmark/program/chase
LARS_PROGRAM_DIR=../starbench/benchmark/program/lars

# ============================================================================
./mars.sh b
echo ""
echo "MARS - Time-Aware Reasoner powered by ARES "
echo ""
# ============================================================================


echo "============= 1. LARS - formulas ============="
./mars.sh r O $LARS_PROGRAM_DIR/atom.star $LARS_DATA_DIR/seq_1k_1k_1_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/box_w32.star $LARS_DATA_DIR/seq_1k_1k_1_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/diamond_w32.star $LARS_DATA_DIR/seq_1k_1k_1_2.stream

echo "============= 1. LARS - conjunction ============="
./mars.sh r O $LARS_PROGRAM_DIR/conjunction_t2.star $LARS_DATA_DIR/seq_1k_1k_2_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/conjunction_t4.star $LARS_DATA_DIR/seq_1k_1k_4_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/conjunction_t8.star $LARS_DATA_DIR/seq_1k_1k_8_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/conjunction_nocom.star $LARS_DATA_DIR/seq_10_100_2_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/conjunction_tran.star $LARS_DATA_DIR/tran_10_100_2_2.stream

echo "============= 3. LARS - Window Size ============="
./mars.sh r O $LARS_PROGRAM_DIR/snow_w08.star $LARS_DATA_DIR/seq_1k_1k_2_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/snow_w16.star $LARS_DATA_DIR/seq_1k_1k_2_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/snow_w32.star $LARS_DATA_DIR/seq_1k_1k_2_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/snow_w64.star $LARS_DATA_DIR/seq_1k_1k_2_2.stream

echo "============= 4. LARS - Flow Rate ============="
./mars.sh r O $LARS_PROGRAM_DIR/snow_w32.star $LARS_DATA_DIR/seq_1k_100_2_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/snow_w32.star $LARS_DATA_DIR/seq_1k_1k_2_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/snow_w32.star $LARS_DATA_DIR/seq_1k_10k_2_2.stream

echo "============= 5. CHASE - Operators ============="
# window=2, box=100%, diamond=0%, event=50%
./mars.sh r R $CHASE_PROGRAM_DIR/deep100_2_100_0_50.star $CHASE_DATA_DIR/deep100_5.stream
./mars.sh r S $CHASE_PROGRAM_DIR/deep100_2_100_0_50.star $CHASE_DATA_DIR/deep100_5.stream
# window=2, box=0%, diamond=100%, event=50%
./mars.sh r R $CHASE_PROGRAM_DIR/deep100_2_0_100_50.star $CHASE_DATA_DIR/deep100_5.stream
./mars.sh r S $CHASE_PROGRAM_DIR/deep100_2_0_100_50.star $CHASE_DATA_DIR/deep100_5.stream

echo "============= 6. CHASE - Events ============="
# window=2, box=50%, diamond=50%, event=0%
./mars.sh r R $CHASE_PROGRAM_DIR/deep100_2_50_50_0.star $CHASE_DATA_DIR/deep100_5.stream
./mars.sh r S $CHASE_PROGRAM_DIR/deep100_2_50_50_0.star $CHASE_DATA_DIR/deep100_5.stream
# window=2, box=50%, diamond=50%, event=25%
./mars.sh r R $CHASE_PROGRAM_DIR/deep100_2_50_50_25.star $CHASE_DATA_DIR/deep100_5.stream
./mars.sh r S $CHASE_PROGRAM_DIR/deep100_2_50_50_25.star $CHASE_DATA_DIR/deep100_5.stream
# window=2, box=50%, diamond=50%, event=50%
./mars.sh r R $CHASE_PROGRAM_DIR/deep100_2_50_50_50.star $CHASE_DATA_DIR/deep100_5.stream
./mars.sh r S $CHASE_PROGRAM_DIR/deep100_2_50_50_50.star $CHASE_DATA_DIR/deep100_5.stream
# window=2, box=50%, diamond=50%, event=75%
./mars.sh r R $CHASE_PROGRAM_DIR/deep100_2_50_50_75.star $CHASE_DATA_DIR/deep100_5.stream
./mars.sh r S $CHASE_PROGRAM_DIR/deep100_2_50_50_75.star $CHASE_DATA_DIR/deep100_5.stream
# window=2, box=50%, diamond=50%, event=100%
./mars.sh r R $CHASE_PROGRAM_DIR/deep100_2_50_50_100.star $CHASE_DATA_DIR/deep100_5.stream
./mars.sh r S $CHASE_PROGRAM_DIR/deep100_2_50_50_100.star $CHASE_DATA_DIR/deep100_5.stream

#echo "============= 7. CHASE - Algorithm ============="
## window=2, box=50%, diamond=50%, event=50%
./mars.sh r R $CHASE_PROGRAM_DIR/deep100_2_50_50_50.star $CHASE_DATA_DIR/deep100_5.stream
## window=2, box=50%, diamond=50%, event=50%
./mars.sh r S $CHASE_PROGRAM_DIR/deep100_2_50_50_50.star $CHASE_DATA_DIR/deep100_5.stream

# ============================================================================

echo "============= X. Math ============="
./mars.sh r O $LARS_PROGRAM_DIR/algebra.star $LARS_DATA_DIR/seq_100_100_1_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/condition.star $LARS_DATA_DIR/seq_100_100_1_2.stream

echo "============= XX. Types of programs ============="
./mars.sh r O $LARS_PROGRAM_DIR/problem_w64.star $LARS_DATA_DIR/seq_100_1k_2_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/traffic_w64.star $LARS_DATA_DIR/seq_100_1k_2_2.stream
./mars.sh r O $LARS_PROGRAM_DIR/snow_w64.star $LARS_DATA_DIR/seq_100_1k_2_2.stream
