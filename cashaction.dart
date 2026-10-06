class _CashAction extends StatelessWidget {
  final IconData icon;
  final String label;
  const _CashAction(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 32),
        const SizedBox(height: 6),
        Text(label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600)),
      ],
    );
  }
}