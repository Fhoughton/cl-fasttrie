(defstruct trie
  "Trie data structure definition"
  (isend nil :type boolean)
  (map (make-hash-table) :type hash-table))

(defun trie-insert (root str)
  "Inserts a new string into the Trie"
  (declare (optimize (speed 3) (safety 0))
           (type simple-string str))
  (when (null root)
    (setf root (make-trie)))
  (let ((temp root))
    (loop for x across str do
         (when (null (gethash  x (trie-map temp)))
           (setf (gethash x (trie-map temp)) (make-trie)))
         (setf temp (gethash x (trie-map temp))))
    (setf (trie-isend temp) T))
  root)

(defun trie-search (root str)
  "Searches the Trie and returns true if in Trie"
  (declare (optimize (speed 3) (safety 0))
           (type simple-string str))
  (when (null root)
    (return-from trie-search nil)) ;false
  (let ((temp root))
    (loop for x across str do
         (setf temp (gethash x (trie-map temp)))
         (when (null temp) (return-from trie-search nil)) ;false
         )
    (trie-isend temp)))

(defun trie-search-recursive (root str)
  "Searches the Trie and returns true if in Trie"
  (declare (optimize (speed 3) (safety 0))
           (type simple-string str))
  (and root
       (loop :for x :across str
          :do (setf root (gethash x (trie-map root)))
          :never (null root))
       (trie-isend root)))
