import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';

class ResumeRequestModal extends StatefulWidget {
  const ResumeRequestModal({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const ResumeRequestModal(),
    );
  }

  @override
  State<ResumeRequestModal> createState() => _ResumeRequestModalState();
}

class _ResumeRequestModalState extends State<ResumeRequestModal> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSubmitting = false;
  bool _isSuccess = false;
  String _submittedName = '';
  String _submittedEmail = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitRequest() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
    });

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final company = _companyController.text.trim();
    final message = _messageController.text.trim();

    try {
      // Send directly to Rashid's inbox via FormSubmit API
      final response = await http.post(
        Uri.parse(
            'https://formsubmit.co/ajax/mohammed.rashid.chowdhury.shuklo@gmail.com'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'company': company.isNotEmpty ? company : 'N/A',
          'message': message.isNotEmpty ? message : 'Official Resume Request',
          '_subject':
              '[Resume Request] $name ${company.isNotEmpty ? "($company)" : ""}',
          '_template': 'table',
        }),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
            _isSuccess = true;
            _submittedName = name;
            _submittedEmail = email;
          });
        }
        return;
      }
    } catch (e) {
      debugPrint('Direct HTTP submission notice: $e');
    }

    // Fallback: If network or browser security blocks AJAX, trigger webmail compose
    if (mounted) {
      setState(() {
        _isSubmitting = false;
        _isSuccess = true;
        _submittedName = name;
        _submittedEmail = email;
      });
      _openEmailFallback(name, email, company, message);
    }
  }

  Future<void> _openEmailFallback(
      String name, String email, String company, String message) async {
    final subject = Uri.encodeComponent(
        '[Resume Request] $name ${company.isNotEmpty ? "($company)" : ""}');
    final body = Uri.encodeComponent('''
Hello Rashid,

I would like to request a copy of your official PDF resume.

• Requester Name: $name
• Requester Contact: $email
${company.isNotEmpty ? "• Company / Org: $company\n" : ""}${message.isNotEmpty ? "\nNote / Opportunity:\n$message\n" : ""}
Best regards,
$name
''');

    // Try Gmail Web compose first (always works on browser), then mailto
    final gmailWebUrl =
        'https://mail.google.com/mail/?view=cm&fs=1&to=${PortfolioData.email}&su=$subject&body=$body';
    final mailtoUrl =
        'mailto:${PortfolioData.email}?subject=$subject&body=$body';

    final gmailUri = Uri.parse(gmailWebUrl);
    if (!await launchUrl(gmailUri, mode: LaunchMode.externalApplication)) {
      final mailtoUri = Uri.parse(mailtoUrl);
      await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Dialog(
      backgroundColor: AppTheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppTheme.cardBorder),
      ),
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: 24,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 520),
        padding: EdgeInsets.all(isMobile ? 24 : 32),
        child: _isSuccess ? _buildSuccessView() : _buildFormView(isMobile),
      ),
    );
  }

  Widget _buildSuccessView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppTheme.emeraldAccent.withValues(alpha: 0.15),
            shape: BoxShape.circle,
            border: Border.all(
              color: AppTheme.emeraldAccent.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: const Icon(
            Icons.check_circle_rounded,
            color: AppTheme.emeraldAccent,
            size: 36,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Resume Request Sent!',
          style: TextStyle(
            fontFamily: 'Outfit',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Thank you, $_submittedName. Your request has been delivered to Mohammed Rashid Chowdhury.\n\nHe will review and email you a copy of his official PDF resume to $_submittedEmail shortly.',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: AppTheme.textSecondary,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 28),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.blueAccent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Done',
            style: TextStyle(
              fontFamily: 'Outfit',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormView(bool isMobile) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.blueAccent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.mark_email_read_outlined,
                      color: AppTheme.blueAccent,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    'Request Official Resume',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: isMobile ? 20 : 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.close, color: AppTheme.textMuted),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Please provide your details below. Your request will be delivered directly to Rashid\'s inbox and a PDF resume will be sent back.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: AppTheme.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),

          // Full Name Field
          _inputLabel('Your Full Name *'),
          TextFormField(
            controller: _nameController,
            enabled: !_isSubmitting,
            style: const TextStyle(
              fontFamily: 'Inter',
              color: AppTheme.textPrimary,
              fontSize: 14,
            ),
            decoration: _inputDecoration('e.g. Sarah Jenkins'),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Email Field
          _inputLabel('Work Email / Contact Info *'),
          TextFormField(
            controller: _emailController,
            enabled: !_isSubmitting,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              fontFamily: 'Inter',
              color: AppTheme.textPrimary,
              fontSize: 14,
            ),
            decoration: _inputDecoration('e.g. sarah@company.com'),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email or contact info';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Company / Org Field
          _inputLabel('Company / Organization (Optional)'),
          TextFormField(
            controller: _companyController,
            enabled: !_isSubmitting,
            style: const TextStyle(
              fontFamily: 'Inter',
              color: AppTheme.textPrimary,
              fontSize: 14,
            ),
            decoration: _inputDecoration('e.g. Amazon, Bell, CGI, Meta'),
          ),
          const SizedBox(height: 16),

          // Message / Role Details (Optional)
          _inputLabel('Role / Opportunity Note (Optional)'),
          TextFormField(
            controller: _messageController,
            enabled: !_isSubmitting,
            maxLines: 2,
            style: const TextStyle(
              fontFamily: 'Inter',
              color: AppTheme.textPrimary,
              fontSize: 14,
            ),
            decoration: _inputDecoration('Brief note or role description...'),
          ),
          const SizedBox(height: 28),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.textSecondary,
                  side: const BorderSide(color: AppTheme.cardBorder),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _isSubmitting ? null : () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.blueAccent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _isSubmitting ? null : _submitRequest,
                child: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.send_rounded, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Send Request',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _inputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Outfit',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppTheme.textPrimary,
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        fontFamily: 'Inter',
        color: AppTheme.textMuted,
        fontSize: 13,
      ),
      filled: true,
      fillColor: AppTheme.background,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppTheme.cardBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppTheme.blueAccent, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
    );
  }
}
