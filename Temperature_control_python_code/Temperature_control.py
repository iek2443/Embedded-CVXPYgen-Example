import cvxpy as cp
from cvxpygen import cpg
import numpy as np

# --- 1. Problem Definition ---

# Parameters: These are the inputs that will change in your embedded system.
x_curr = cp.Parameter(1, name='x_curr')     # Current temperature (Sensor input)
x_ref  = cp.Parameter(1, name='x_ref')      # Reference/Target temperature
k_gain = cp.Parameter(1, name='k_gain')     # Cooling system gain (Expected to be negative)

# nonneg=True ensures DPP compliance for the control cost term.
lambda_cost = cp.Parameter(1, name='lambda_cost', nonneg=True) 

# Variable: The optimal control input (Fan/Motor Power).
u = cp.Variable(1, name='u')                 

# Objective Function: min (Error Squared) + (Control Cost)
temp_error = x_curr + k_gain @ u - x_ref
control_cost = lambda_cost * cp.sum_squares(u) 

objective = cp.Minimize(cp.sum_squares(temp_error) + control_cost)

# Constraints: u >= 0 (Single-direction) and u <= 10.0 (Max power level)
constraints = [u >= 0.0,  
               u <= 10.0]   
problem = cp.Problem(objective, constraints)

# --- 2. C Code Generation and Solver Module Loading ---

code_dir_name = 'embedded_cooling_solver'
print("Generating Embedded Cooling Control C code...")

solver_module = cpg.generate_code(
    problem,
    code_dir=code_dir_name, 
    solver='SCS'                
)
print(f"C code generation complete! Check the '{code_dir_name}' directory.")

# --- 3. Testing the Generated Solver in Python ---
print("\nTesting the generated solver in Python...")
U_MAX_POWER = 10.0 

# Define fixed test values for the system model
K_GAIN = np.array([-0.5])
LAMBDA_COST = np.array([0.1])

def run_test_scenario(current_temp, ref_temp):
    """Runs the optimization for the given temperatures and prints results."""
    x_curr.value = np.array([current_temp])   
    x_ref.value  = np.array([ref_temp])   
    k_gain.value = K_GAIN
    lambda_cost.value = LAMBDA_COST

    problem.solve(solver=solver_module) 
    u_val = u.value[0]
    
    # Calculate PWM Duty Cycle (0-100%)
    duty_cycle_val = (u_val / U_MAX_POWER) * 100.0
    
    # Predict the final temperature based on the optimal input
    predicted_temp = x_curr.value[0] + k_gain.value[0] * u_val

    print(f"\n--- Test: {current_temp:.1f}°C -> {ref_temp:.1f}°C ---")
    print(f"Optimal Control Signal (u, range: 0.0 - {U_MAX_POWER:.1f}): {u_val:.4f}")
    print(f"Fan PWM Duty Cycle (%): {np.clip(duty_cycle_val, 0, 100):.2f}%")
    print(f"Predicted New Temperature: {predicted_temp:.2f}°C")


# --- Scenario Tests ---

# Scenario 1: Overheated 
run_test_scenario(current_temp=30.0, ref_temp=20.0)

# Scenario 2: Slightly Warm 
run_test_scenario(current_temp=23.0, ref_temp=20.0)

# Scenario 3: No Cooling Needed 
run_test_scenario(current_temp=20.0, ref_temp=20.0)