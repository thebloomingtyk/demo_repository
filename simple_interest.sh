#!/bin/bash

# Simple Interest Calculator

# Function to calculate simple interest
calculate_simple_interest() {
    principal=$1
    rate=$2
    time=$3

    interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)
    echo "Simple Interest: \$ $interest"
}

# Main script

# Check if all required arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <principal_amount> <interest_rate> <time_in_years>"
    exit 1
fi

principal_amount=$1
interest_rate=$2
time_in_years=$3

# Check if the provided arguments are valid numbers
if ! [[ $principal_amount =~ ^[0-9]+([.][0-9]+)?$ && $interest_rate =~ ^[0-9]+([.][0-9]+)?$ && $time_in_years =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Invalid input. Please provide valid numerical values for principal_amount, interest_rate, and time_in_years."
    exit 1
fi

# Calculate and display the simple interest
calculate_simple_interest $principal_amount $interest_rate $time_in_years
