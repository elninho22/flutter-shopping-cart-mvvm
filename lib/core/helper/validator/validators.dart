import 'package:flutter/material.dart';

class Validators {
  Validators._();

  static FormFieldValidator required({String m = 'Campo obrigatório'}) => (v) {
    if (v?.isEmpty ?? true) {
      return m;
    }
    return null;
  };

  static FormFieldValidator minCharacters({int? minLength = 6, String? message}) => (v) {
    if (v?.length >= minLength) {
      return null;
    }
    return message ?? 'O mínimo de caractéres é: $minLength';
  };

  static FormFieldValidator noAtSymbol({String m = 'URL não pode conter @'}) => (v) {
    if (v == null) {
      return null;
    }
    if (v.toString().contains('@')) {
      return m;
    }
    return null;
  };

  static FormFieldValidator url({String? message}) => (v) {
    if (v?.isEmpty ?? true) {
      return null; 
    }
    
    final url = v!.trim();
    final uri = Uri.tryParse(url);
    
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      return message ?? 'URL inválida';
    }
    
    if (uri.scheme != 'https') {
      return message ?? 'URL deve começar com https://';
    }
    
    return null;
  };

    static FormFieldValidator<String> multiple(
    List<FormFieldValidator<String>> v,
  ) =>
      (value) {
        for (final validator in v) {
          final result = validator(value);
          if (result != null) {
            return result;
          }
        }
        return null;
      };

        static bool isValidSecureUrl(String? url) {
    if (url == null || url.isEmpty) {
      return false;
    }
    
    final trimmedUrl = url.trim();
    final uri = Uri.tryParse(trimmedUrl);
    
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      return false;
    }
    return uri.scheme == 'https';
  }

  static bool isValidUrl(String? url) {
    if (url == null || url.isEmpty) {
      return false;
    }
    
    final trimmedUrl = url.trim();
    final uri = Uri.tryParse(trimmedUrl);
    
    return uri != null && uri.hasScheme && uri.hasAuthority;
  }
}
