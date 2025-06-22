;; Contract Manager Verification Contract
;; Validates and manages contract managers

(define-map contract-managers principal bool)
(define-map manager-details principal {
  name: (string-ascii 100),
  department: (string-ascii 50),
  authorized-at: uint,
  status: (string-ascii 20)
})

(define-data-var contract-owner principal tx-sender)

;; Add a new contract manager
(define-public (add-manager (manager principal) (name (string-ascii 100)) (department (string-ascii 50)))
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err u401))
    (map-set contract-managers manager true)
    (map-set manager-details manager {
      name: name,
      department: department,
      authorized-at: block-height,
      status: "active"
    })
    (ok true)
  )
)

;; Remove a contract manager
(define-public (remove-manager (manager principal))
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err u401))
    (map-set contract-managers manager false)
    (map-set manager-details manager (merge
      (unwrap! (map-get? manager-details manager) (err u404))
      { status: "inactive" }
    ))
    (ok true)
  )
)

;; Check if a principal is an authorized manager
(define-read-only (is-authorized-manager (manager principal))
  (default-to false (map-get? contract-managers manager))
)

;; Get manager details
(define-read-only (get-manager-details (manager principal))
  (map-get? manager-details manager)
)
