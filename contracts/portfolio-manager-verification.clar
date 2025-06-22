;; Portfolio Manager Verification Contract
;; Validates and manages portfolio managers

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_VERIFIED (err u101))
(define-constant ERR_NOT_VERIFIED (err u102))

;; Data maps
(define-map verified-managers principal bool)
(define-map manager-credentials principal {experience: uint, certification: (string-ascii 50)})

;; Public functions
(define-public (verify-manager (manager principal) (experience uint) (certification (string-ascii 50)))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-none (map-get? verified-managers manager)) ERR_ALREADY_VERIFIED)
    (map-set verified-managers manager true)
    (map-set manager-credentials manager {experience: experience, certification: certification})
    (ok true)
  )
)

(define-public (revoke-verification (manager principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-some (map-get? verified-managers manager)) ERR_NOT_VERIFIED)
    (map-delete verified-managers manager)
    (map-delete manager-credentials manager)
    (ok true)
  )
)

;; Read-only functions
(define-read-only (is-verified-manager (manager principal))
  (default-to false (map-get? verified-managers manager))
)

(define-read-only (get-manager-credentials (manager principal))
  (map-get? manager-credentials manager)
)
