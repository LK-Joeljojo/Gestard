enum UserRole { admin, employee }

enum PlanningStatus { draft, pending, validated }

enum AttendanceStatus { onTime, late, waitingValidation, validated }

enum SyncActionType {
  declareArrival,
  validateArrival,
  createPlanning,
  updatePlanning,
}
