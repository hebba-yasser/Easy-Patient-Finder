# Easy Patient Finder (Dental Application)

**Facilitating Dental Student Practice Through Automated Case Matching**

Easy Patient Finder is a mobile application designed to streamline the process of dental students finding patients who match their academic requirements for practical training. By automating case discovery and management, the application eliminates the need for students to search for patients independently, saving time and improving the learning experience.
 
 ## Table of Contents

*   [Features](#features)
*   [User Roles](#user-roles)
*   [Usage](#usage)
*   [ML Model](#ml-model)
*   [Contact](#contact)

## Features

*   **Automated Case Matching:** Students can easily find cases that align with their specific training needs.
*   **Case Management:** Doctors can create, manage, and post patient cases with detailed medical information and images.
*   **AI-Powered Diagnosis:** An integrated machine learning model provides preliminary diagnoses based on uploaded patient images.
*   **Role-Based Access Control:** Different user roles (Student, Doctor, Supervisor, Admin) have specific permissions and functionalities.
*   **Request/Approval Workflow:** Students can request to work on a case, and supervisors can approve or deny these requests.
*   **Search and Filtering:** Robust search and filtering options allow students to quickly find relevant cases.
*   **Secure Data Storage:** Patient data is stored securely and with appropriate privacy measures.

## User Roles

*   **Dental Student:** Browse and filter cases based on requirements, request cases for practice, and track progress on assigned cases.
*   **Doctor:** Create patient cases, upload images for AI diagnosis, manage cases, and track student assignments.
*   **Supervisor:**  Review and approve student requests, monitor student progress, edit doctor cases as needed, and ensure academic standards.
*   **Admin:**  Manage users, system settings, and overall application functionality, including security and maintenance.
## Usage

**Workflow:**

1.  A Doctor creates a new patient case, including medical history, current condition, and uploads relevant images.
2.  The ML model analyzes the images and provides a preliminary diagnosis.
3.  The Doctor reviews the diagnosis and posts the case.
4.  Dental Students browse available cases, filtering by their requirements (e.g., specific procedures, age groups).
5.  A Student finds a suitable case and sends a request to their Supervisor.
6.  The Supervisor reviews the request and approves or denies it.
7.  If approved, the Student can begin working on the case under supervision.


## ML Model

The Easy Patient Finder application uses a Convolutional Neural Network (CNN) for analyzing medical images and diagnosing various dental and maxillofacial conditions. This CNN-based model has been trained on a large dataset of patient images to provide accurate diagnoses.
### Model Accuracy
- The model achieves an accuracy of **89%** on the diagnostic tasks, ensuring reliable identification of conditions like **complete edentulous**, **partial edentulous**, and various **maxillofacial** issues (such as problems involving the **nose**, **ear**, **eyes**, etc.).

### Supported Diagnoses:
1. **Complete Edentulous**:
   - The model detects complete tooth loss in either the upper or lower jaw, assisting in the diagnosis of patients who may require complete dentures.

2. **Partial Edentulous**:
   - The model identifies cases where a patient is missing some teeth but not all, making it useful for identifying candidates for partial dentures or bridges.

3. **Maxillofacial Conditions**:
   - The model can also diagnose injuries or abnormalities in the **nose**, **ears**, **eyes**, and other facial structures, helping doctors identify complex cases that may require additional procedures or reconstructive work.

### Example Use Case:
1. A **doctor** uploads a patient’s image showing a potential maxillofacial injury.
2. The **CNN model** processes the image and provides a diagnosis, e.g., “Nose Maxillofacial” with an accuracy of 89%.
3. The **doctor** posts the case along with the medical details and diagnosis.

### Diagnosis Example
![12](https://github.com/user-attachments/assets/d5248be7-ea41-48ed-bacf-081e7b2dcf45)


## Contact

For questions or feedback, please contact us at [hebbayasser12@gmail.com].
